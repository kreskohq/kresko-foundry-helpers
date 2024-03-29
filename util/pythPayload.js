const { encodeAbiParameters, parseAbiParameters } = require('viem');
const PYTH_STABLE = require('./pyth_stable_ids.json');

const success = (str) => {
	process.stdout.write(Buffer.from(str).toString('utf-8'));
	process.exit(0);
};

const error = (str) => {
	process.stderr.write(Buffer.from(str).toString('utf-8'));
	process.exit(1);
};

const outputParams = parseAbiParameters([
	'bytes32[] ids, bytes[] updatedatas, Price[] prices',
	'struct Price { int64 price; uint64 conf; int32 exp; uint256 timestamp; }',
]);

async function getPrices(assets, isString) {
	if (assets.length === 0) {
		error('You have to provide at least one feed');
	}

	const query = assets.reduce((res, asset) => {
		const id = !isString ? asset : PYTH_STABLE[asset.toUpperCase()];
		if (!id) error(`Asset ${asset} not found`);

		return res.concat(`&ids[]=${id}`);
	}, '');

	const data = await fetch(`https://hermes.pyth.network/v2/updates/price/latest?${query.slice(1)}&binary=true`).then(
		(r) => r.json()
	);

	return encodeAbiParameters(outputParams, [
		data.parsed.map(({ id }) => `0x${id}`),
		data.binary.data.map((d) => `0x${d}`),
		data.parsed.map(({ price }) => Object.values(price)),
	]);
}

const getPayloadHardhat = async (assets) => {
	if (assets.length === 0) {
		error('You have to provide at least one asset from hardhat config');
	}
	const ids = assets.filter((a) => a.pyth.id).map((a) => a.pyth.id);

	// const assetPrices = testnetConfigs[hre.network.name].assets.map(a => a?.price || 1e8)
	const query = ids.reduce((res, pythId) => {
		if (!pythId) error(`Asset not found: ${pythId}`);

		return res.concat(`&ids[]=${pythId}`);
	}, '');

	const response = await fetch(`https://hermes.pyth.network/api/latest_price_feeds?${query.slice(1)}&binary=true`);
	const data = await response.json();
	return data.map(({ vaa }) => `0x${Buffer.from(vaa, 'base64').toString('hex')}`);
};

if (!process.env.HARDHAT) {
	getPrices(
		!process.argv[2].startsWith('0x') ? process.argv[2].split(',') : process.argv.slice(2),
		!process.argv[2].startsWith('0x')
	)
		.then((res) => {
			success(res);
		})
		.catch((e) => {
			error(e.message);
		});
}

module.exports = {
	getPrices,
	getPayloadHardhat,
};

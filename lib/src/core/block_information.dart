part of web3dart;

class BlockInformation {
  BlockInformation({
    required this.baseFeePerGas,
    required this.timestamp,
    required this.gasLimit,
  });

  factory BlockInformation.fromJson(Map<String, dynamic> json) {
    return BlockInformation(
      baseFeePerGas: json.containsKey('baseFeePerGas')
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              hexToInt(json['baseFeePerGas'] as String),
            )
          : null,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        hexToDartInt(json['timestamp'] as String) * 1000,
        isUtc: true,
      ),
      gasLimit: json.containsKey('gasLimit')
          ? hexToInt(json['gasLimit'] as String).toInt()
          : null,
    );
  }

  final EtherAmount? baseFeePerGas;
  final DateTime timestamp;
  final int? gasLimit;
  bool get isSupportEIP1559 => baseFeePerGas != null;
}

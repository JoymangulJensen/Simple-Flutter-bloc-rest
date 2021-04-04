import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/noise/noise_api_client.dart';

class NoiseRespository {
  final NoiseApiClient noiseApiClient;

  NoiseRespository({@required this.noiseApiClient})
      : assert(noiseApiClient != null);

  Future<Noise> getNoise(int noiseId) async {
    Noise noise = await noiseApiClient.fetchNoise(noiseId);
    print(noise.toString());
    return await noiseApiClient.fetchNoise(noiseId);
  }
}

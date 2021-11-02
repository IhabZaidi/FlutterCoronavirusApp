import 'package:bloc/bloc.dart';
import 'package:coronavirusapp/data/connection/api.dart';
import 'package:coronavirusapp/data/connection/api_service.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'loaddata_state.dart';

class LoaddataCubit extends Cubit<LoaddataState> {
  LoaddataCubit() : super(LoaddataInitial()){getData();}
  String _accessTocken = '';
  int casesSuspected = 0;
  int casesDeath = 0;
  int casesConfirmed = 0;
  int casesRecovered = 0;

  void getData() async {
    try {
      final apiservice = ApiService(api: Api.sandbox());
      _accessTocken = await apiservice.getAccessTocken();
      casesSuspected = await apiservice.getEndpointData(
          accessToken: _accessTocken, endpoint: Endpoints.casesSuspected);
        casesConfirmed = await apiservice.getEndpointData(
          accessToken: _accessTocken, endpoint: Endpoints.casesConfirmed);
          casesDeath = await apiservice.getEndpointData(
          accessToken: _accessTocken, endpoint: Endpoints.deaths);
          casesRecovered = await apiservice.getEndpointData(
          accessToken: _accessTocken, endpoint: Endpoints.recovered); 
      emitLoaded();
    } on Response catch (responce) {
      if (responce.statusCode == 401) {
       emitError();
      }
    }
  }
  void emitLoaded() => emit(LoaddataLoaded());
  void emitError() => emit(LoaddataError());
}

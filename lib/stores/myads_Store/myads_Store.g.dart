// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myads_Store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAdsStoreController on _MyAdsStoreControllerBase, Store {
  Computed<List<ModelAnnouncement>>? _$activeAdsComputed;

  @override
  List<ModelAnnouncement> get activeAds => (_$activeAdsComputed ??=
          Computed<List<ModelAnnouncement>>(() => super.activeAds,
              name: '_MyAdsStoreControllerBase.activeAds'))
      .value;

  final _$allAdsAtom = Atom(name: '_MyAdsStoreControllerBase.allAds');

  @override
  List<ModelAnnouncement>? get allAds {
    _$allAdsAtom.reportRead();
    return super.allAds;
  }

  @override
  set allAds(List<ModelAnnouncement>? value) {
    _$allAdsAtom.reportWrite(value, super.allAds, () {
      super.allAds = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MyAdsStoreControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  @override
  String toString() {
    return '''
allAds: ${allAds},
loading: ${loading},
activeAds: ${activeAds}
    ''';
  }
}

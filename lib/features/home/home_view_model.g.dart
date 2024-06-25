// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$bannersAtom =
      Atom(name: 'HomeViewModelBase.banners', context: context);

  @override
  List<HomeBanner> get banners {
    _$bannersAtom.reportRead();
    return super.banners;
  }

  @override
  set banners(List<HomeBanner> value) {
    _$bannersAtom.reportWrite(value, super.banners, () {
      super.banners = value;
    });
  }

  late final _$sectionsAtom =
      Atom(name: 'HomeViewModelBase.sections', context: context);

  @override
  List<HomeSection> get sections {
    _$sectionsAtom.reportRead();
    return super.sections;
  }

  @override
  set sections(List<HomeSection> value) {
    _$sectionsAtom.reportWrite(value, super.sections, () {
      super.sections = value;
    });
  }

  late final _$fetchSectionsAsyncAction =
      AsyncAction('HomeViewModelBase.fetchSections', context: context);

  @override
  Future<void> fetchSections() {
    return _$fetchSectionsAsyncAction.run(() => super.fetchSections());
  }

  @override
  String toString() {
    return '''
banners: ${banners},
sections: ${sections}
    ''';
  }
}

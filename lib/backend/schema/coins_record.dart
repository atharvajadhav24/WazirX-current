import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'coins_record.g.dart';

abstract class CoinsRecord implements Built<CoinsRecord, CoinsRecordBuilder> {
  static Serializer<CoinsRecord> get serializer => _$coinsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'coin_name')
  String get coinName;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CoinsRecordBuilder builder) => builder
    ..coinName = ''
    ..price = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coins');

  static Stream<CoinsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CoinsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CoinsRecord._();
  factory CoinsRecord([void Function(CoinsRecordBuilder) updates]) =
      _$CoinsRecord;

  static CoinsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCoinsRecordData({
  String coinName,
  String price,
}) =>
    serializers.toFirestore(
        CoinsRecord.serializer,
        CoinsRecord((c) => c
          ..coinName = coinName
          ..price = price));

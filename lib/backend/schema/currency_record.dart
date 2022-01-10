import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'currency_record.g.dart';

abstract class CurrencyRecord
    implements Built<CurrencyRecord, CurrencyRecordBuilder> {
  static Serializer<CurrencyRecord> get serializer =>
      _$currencyRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'currency_name')
  String get currencyName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CurrencyRecordBuilder builder) =>
      builder..currencyName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('currency');

  static Stream<CurrencyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CurrencyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CurrencyRecord._();
  factory CurrencyRecord([void Function(CurrencyRecordBuilder) updates]) =
      _$CurrencyRecord;

  static CurrencyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCurrencyRecordData({
  String currencyName,
}) =>
    serializers.toFirestore(CurrencyRecord.serializer,
        CurrencyRecord((c) => c..currencyName = currencyName));

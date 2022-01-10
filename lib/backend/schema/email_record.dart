import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'email_record.g.dart';

abstract class EmailRecord implements Built<EmailRecord, EmailRecordBuilder> {
  static Serializer<EmailRecord> get serializer => _$emailRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EmailRecordBuilder builder) => builder
    ..email = ''
    ..password = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('email');

  static Stream<EmailRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EmailRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EmailRecord._();
  factory EmailRecord([void Function(EmailRecordBuilder) updates]) =
      _$EmailRecord;

  static EmailRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEmailRecordData({
  String email,
  String password,
}) =>
    serializers.toFirestore(
        EmailRecord.serializer,
        EmailRecord((e) => e
          ..email = email
          ..password = password));

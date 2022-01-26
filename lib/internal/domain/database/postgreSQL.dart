// import 'package:griffin_phoenix/internal/services/database/i_database_service.dart';
// import 'package:griffin_phoenix/internal/services/log_service.dart';
// import 'package:postgres/postgres.dart';

// class PostgresDB extends IDatabaseService {
//   final _connection = PostgreSQLConnection(
//     '192.168.1.154',
//     5050,
//     'griffin',
//     username: 'postgres',
//     password: 'zxcv',
//   );

//   @override
//   Future<void> connect() async => await _connection.open();
//   @override
//   Future<void> close() async => await _connection.close();

//   @override
//   Future<List?>? getItems({required String table}) async {
//     return await _connection.query('SELECT * FROM $table');
//   }

//   Future query(String query) async => await _connection.query(query);

//   @override
//   Future<List?> insertItems({
//     required String table,
//     required Map<String, dynamic> items,
//     OnConflict onConflict = OnConflict.doUpdate,
//     List<String>? onConflictFields,
//   }) async {
//     late String query;

//     try {
//       final List keys = items.keys.toList();
//       final List values = items.values.toList();

//       final String columns = keys.join(', ');
//       final String row = keys.join(', @');

//       query = '''INSERT INTO $table ($columns)
//           VALUES (@$row)''';

//       String updateText = '';

//       if (onConflict == OnConflict.doUpdate) {
//         if (onConflictFields == null) {
//           onConflictFields ??= [keys[0]];
//           updateText += '${keys[0]} = EXCLUDED.${keys[0]}';
//           for (var i = 1; keys.length >= 2 && i < keys.length; i++) {
//             updateText += ', ${keys[i]} = EXCLUDED.${keys[i]}';
//           }
//         } else {
//           updateText +=
//               '${onConflictFields[0]} = EXCLUDED.${onConflictFields[0]}';
//           for (var i = 1;
//               keys.length >= 2 && i < onConflictFields.length;
//               i++) {
//             updateText +=
//                 ', ${onConflictFields[i]} = EXCLUDED.${onConflictFields[i]}';
//           }
//         }
//         query +=
//             ' ON CONFLICT (${onConflictFields.join(", ")}) DO UPDATE SET $updateText';
//       } else if (onConflict == OnConflict.doNothing) {
//         if (onConflictFields != null) {
//           query += ' ON CONFLICT (${onConflictFields.join(", ")}) DO NOTHING';
//         } else {
//           query += ' ON CONFLICT (${keys[0]}) DO NOTHING';
//         }
//       }

//       query += ' RETURNING *';

//       var result = await _connection.query(query, substitutionValues: items);

//       // LogService.logEvent(
//       //   'inserted data (${keys[0]}:${values[0]}) into $table',
//       // );

//       return result;
//     } catch (e) {
//       LogService.handleError('query: $query. $e');
//     }
//   }
// }

// enum OnConflict { doNothing, doUpdate, none }

// //   await _db.query('''
// // Create TABLE rooms (
// //     id SERIAL PRIMARY KEY,
// //     audience VARCHAR,
// //     building VARCHAR
// // )''');

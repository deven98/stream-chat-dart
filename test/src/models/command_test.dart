import 'package:flutter_test/flutter_test.dart';
import 'package:stream_chat/src/models/command.dart';
import 'dart:convert';

import 'package:stream_chat/src/models/user.dart';

void main() {
  group('src/models/command', () {
    const jsonExample = '''
      {
        "name": "giphy",
        "description": "Post a random gif to the channel",
        "args": "[text]"
      }      
      ''';

    test('should parse json correctly', () {
      final command = Command.fromJson(json.decode(jsonExample));
      expect(command.name, 'giphy');
      expect(command.description, 'Post a random gif to the channel');
      expect(command.args, '[text]');
    });

    test('should serialize to json correctly', () {
      final command = Command(
        'giphy',
        'Post a random gif to the channel',
        '[text]',
      );

      expect(
        command.toJson(),
        {
          "name": "giphy",
          "description": "Post a random gif to the channel",
          "args": "[text]",
        },
      );
    });
  });
}

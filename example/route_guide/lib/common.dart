// Copyright (c) 2017, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:convert';
import 'dart:io';

import 'generated/route_guide.pb.dart';

const benchmarkFeaturesCounts = <int>[100, 500, 1000];

const coordFactor = 1e7;

final List<Feature> featuresDb = _readDatabase();

List<Feature> _readDatabase() {
  final dbData = File('lib/assets/data/route_guide_db.json').readAsStringSync();
  final List db = jsonDecode(dbData);
  return db.map((entry) {
    final location = Point()
      ..latitude = entry['location']['latitude']
      ..longitude = entry['location']['longitude'];
    return Feature()
      ..name = entry['name']
      ..location = location;
  }).toList();
}

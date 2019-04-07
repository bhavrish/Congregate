# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the \"License\");
# you may not use this file except in compliance with the License.\n",
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an \"AS IS\" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import tensorflow as tf
import os
import math

def create_file_reader_ops(filename_queue):
    reader = tf.TextLineReader(skip_header_lines=1)
    _, csv_row = reader.read(filename_queue)
    record_defaults = [[""], [""], [0], [0], [0], [0]]
    zipCode, density, hour, month, day = tf.decode_csv(csv_row, record_defaults=record_defaults)
    all_zips, weight_densities = process_file_statistics(zipCode, density, hour)
    return all_zips, weight_densities

def process_file_statistics(zipCode, density, hour):
    unique_zips = []
    pop_densities = []
    current_zip = 0
    agg_density = 0
    for index in range(len(zipCode)):
        if zipCode[index] not in unique_zips:
            unique_zips.append(zipCode[index])
            current_zip = zipCode[index]
            pop_densities.append(agg_density)
            agg_density = 0
        elif zipCode[index] == current_zip:
            agg_density += density[index] * (math.sin(math.pi*hour/6.0 - 4.0) + 0.734)
    return unique_zips, pop_densities

filenames = ["./fake-data.csv"]
filename_queue = tf.train.string_input_producer(filenames, num_epochs=1, shuffle=False)
testzip, density = create_file_reader_ops(filename_queue)

with tf.Session() as sess:
    tf.global_variables_initializer().run()
    coord = tf.train.Coordinator()
    threads = tf.train.start_queue_runners(coord=coord)
    while True:
        try:
            zip_code, test_data = sess.run([testzip, density])
            print(zip_code, test_data)
        except tf.errors.OutOfRangeError:
            break
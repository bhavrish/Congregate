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

tf.enable_eager_execution()

def create_file_reader_ops(filename):
    dataset = tf.data.experimental.CsvDataset(
        filename,
        [tf.string,  # Required field, use dtype or empty tensor
        tf.float32,  # Optional field, default to 0.0
        tf.int32,  # Required field, use dtype or empty tensor
        ],
        header=True,
        select_cols=[0,1,2]  # Only parse first three columns
    )
    all_zips, weight_densities = process_file_statistics(dataset)
    return all_zips, weight_densities

def process_file_statistics(dataset):
    unique_zips = []
    pop_densities = []
    current_zip = 0
    agg_density = 0
    for element in dataset:
        if element[0] not in unique_zips:
            unique_zips.append(element[0])
            current_zip = element[0]
            pop_densities.append(agg_density)
            agg_density = 0
        elif element[0] == current_zip:
            agg_density += element[1] * (math.sin(math.pi*element[2]/6.0 - 4.0) + 0.734)
    return unique_zips, pop_densities

filenames = ["fake-data.csv"]
testzip, density = create_file_reader_ops(filenames)

with tf.Session() as sess:
    tf.global_variables_initializer().run()
    coord = tf.train.Coordinator()
    threads = tf.train.start_queue_runners(coord=coord)
    file = open("zip_data.txt", "w")
    while True:
        try:
            zip_code, test_data = sess.run([testzip, density])
            file.write(zip_code, test_data)
        except tf.errors.OutOfRangeError:
            break
    file.close()
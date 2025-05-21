Create a raw file with random contents
  $ dd if=/dev/random of=test.raw bs=65536 count=16 > /dev/null 2>&1

Convert it to qcow file and back to raw
  $ ./main.exe encode test.raw test.qcow2
  $ ./main.exe decode test.qcow2 transform.raw

Check that contents are the same
  $ diff test.raw transform.raw

Check stream_decode works the same as seeking decode
  $ cat test.qcow2 | ./main.exe stream_decode stream_transform.raw
  $ diff test.raw stream_transform.raw

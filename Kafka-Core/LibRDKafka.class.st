"
I am the FFI library definition for the Kafka C library:
https://docs.confluent.io/platform/current/clients/librdkafka/html/index.html

I look for a 'librdkafka' dynamic library.
"
Class {
	#name : #LibRDKafka,
	#superclass : #FFILibrary,
	#category : #'Kafka-Core'
}

{ #category : #'accessing - platform' }
LibRDKafka >> macLibraryName [ 
	^ 'librdkafka.dylib'

]

{ #category : #'accessing - platform' }
LibRDKafka >> unixLibraryName [ 
	^ 'librdkafka.so'

]

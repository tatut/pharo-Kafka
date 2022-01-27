"
I am the Kafka library configuration.
All keys and values are strings (set:to: will convert to strings).

>>> c := KfConfig new. 
>>> c set: 'compression.codec' to: 'snappy'.

Will signal error if key is unknown or value is invalid for the configuration.

"
Class {
	#name : #KfConfig,
	#superclass : #KfObject,
	#category : #'Kafka-Core'
}

{ #category : #'as yet unclassified' }
KfConfig >> ffiConfSet: optName to: optVal err: err [
  self ffiCall: #(	int rd_kafka_conf_set(void* rdObj, char* optName, char* optVal, char* err, int 512) ) 
	     module: LibRDKafka .
	
]

{ #category : #initialization }
KfConfig >> makeRdObj [ 
	self ffiCall: #(void* rd_kafka_conf_new()) module: LibRDKafka 
]

{ #category : #initialization }
KfConfig >> set: optionName to: optionValue [
	"Set the given option name to value. Both are converted to strings."
	| optName optVal err res |
	optName := optionName asString.
	optVal := optionValue asString.
	err := ExternalAddress allocate: 512.
	
	res := self ffiConfSet: optName to: optVal err: err. 
		
	res isZero ifFalse: [ 
		Error new signal: err fromCString.
	].	
	^ self

]

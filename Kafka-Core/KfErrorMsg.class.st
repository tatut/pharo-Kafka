"
I am a process local external address for storing an error message
that may come from kf_kafka_* C function calls.
"
Class {
	#name : #KfErrorMsg,
	#superclass : #ProcessLocalVariable,
	#category : #'Kafka-Core'
}

{ #category : #'as yet unclassified' }
KfErrorMsg class >> checkReturn: kfReturnValue [
	kfReturnValue isZero ifFalse: [ 
		Error new signal: self value fromCString 
	].
	
]

{ #category : #accessing }
KfErrorMsg class >> value [ 
	self soleInstance valueOrNil ifNil: [ self soleInstance value: (ExternalAddress allocate: 512) ].
	^ self soleInstance valueOrNil  
]

"
I host a librdkafka object (rdObj) instance.
"
Class {
	#name : #KfObject,
	#superclass : #Object,
	#instVars : [
		'rdObj'
	],
	#category : #'Kafka-Core'
}

{ #category : #initialization }
KfObject >> initialize [
	rdObj := self makeRdObj 
]

{ #category : #initialization }
KfObject >> makeRdObj [ 
	self subclassResponsibility 
]

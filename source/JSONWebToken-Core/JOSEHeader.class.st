"
Common superclass for Javascript Object Signing and Encryption headers (JOSE)
"
Class {
	#name : 'JOSEHeader',
	#superclass : 'Object',
	#instVars : [
		'properties',
		'strict'
	],
	#category : 'JSONWebToken-Core-Headers',
	#package : 'JSONWebToken-Core',
	#tag : 'Headers'
}

{ #category : 'mapping' }
JOSEHeader class >> neoJsonMapping: mapper [

  mapper for: self do: [ :mapping |
      mapping
        mapInstVar: #type to: #typ;
        mapInstVar: #algorithm to: #alg
    ]
]

{ #category : 'comparing' }
JOSEHeader >> = aHeader [
	^ aHeader hasSameElements: properties
]

{ #category : 'accessing' }
JOSEHeader >> at: aString [

  ^ strict
      ifTrue: [ properties at: aString ]
      ifFalse: [ properties at: aString ifAbsent: [ nil ] ]
]

{ #category : 'accessing' }
JOSEHeader >> at: aKey put: aValue [
	properties at: aKey put: aValue
]

{ #category : 'initialization' }
JOSEHeader >> beLenient [

	strict := false
]

{ #category : 'initialization' }
JOSEHeader >> beStrict [

	strict := true
]

{ #category : 'testing' }
JOSEHeader >> hasSameElements: aDictionary [
	^ (properties difference: aDictionary) isEmpty
]

{ #category : 'comparing' }
JOSEHeader >> hash [
	^ properties hash
]

{ #category : 'initialization' }
JOSEHeader >> initialize [

  super initialize.
  self beStrict
]

{ #category : 'accessing' }
JOSEHeader >> kid [
"Public Key ID"
	^ self at: 'kid'
]

{ #category : 'accessing' }
JOSEHeader >> kid: anObject [
	self at: 'kid' put: anObject
]

{ #category : 'accessing' }
JOSEHeader >> typ [
	^ self type
]

{ #category : 'accessing' }
JOSEHeader >> typ: aString [
	self type: aString
]

{ #category : 'accessing' }
JOSEHeader >> type [
	^ self at: 'typ'
]

{ #category : 'accessing' }
JOSEHeader >> type: anObject [
	self at: 'typ' put: anObject
]

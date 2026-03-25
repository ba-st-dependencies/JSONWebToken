"
An empty algorithm for not signing
"
Class {
	#name : 'JWANone',
	#superclass : 'JsonWebAlgorithm',
	#category : 'JSONWebToken-Core-Algorithms',
	#package : 'JSONWebToken-Core',
	#tag : 'Algorithms'
}

{ #category : 'sign' }
JWANone class >> checkSignature: signature withKey: key isValidFor: headerAndPayload [
	
]

{ #category : 'accessing' }
JWANone class >> parameterValue [
	^ 'none'
]

{ #category : 'sign' }
JWANone class >> signMessage: aString withKey: key [

  ^ #[  ]
]

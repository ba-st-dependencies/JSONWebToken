"
A JWTHeaderTest is a test class for testing the behavior of JWTHeader
"
Class {
	#name : 'JWEHeaderTest',
	#superclass : 'TestCase',
	#category : 'JSONWebToken-Core-Tests',
	#package : 'JSONWebToken-Core-Tests'
}

{ #category : 'tests' }
JWEHeaderTest >> testAccessing [

  | header |
  header := JWEHeader new
              alg: 'RS256';
              typ: 'at+jwt';
              kid: 'v-1.0.4';
              yourself.
  self
    assert: header alg equals: 'RS256';
    assert: header typ equals: 'at+jwt';
    assert: header kid equals: 'v-1.0.4'
]

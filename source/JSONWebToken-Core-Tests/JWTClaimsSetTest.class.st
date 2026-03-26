"
A JWTClaimsSetTest is a test class for testing the behavior of JWTClaimsSet
"
Class {
	#name : 'JWTClaimsSetTest',
	#superclass : 'TestCase',
	#category : 'JSONWebToken-Core-Tests',
	#package : 'JSONWebToken-Core-Tests'
}

{ #category : 'tests' }
JWTClaimsSetTest >> testAccessing [

  | claimSet |
  claimSet := JWTClaimsSet new
                issuer: 'https://auth.example.com';
                subject: 'user_987654321';
                audiences: 'https://api.example.com';
                issuedAt: 1742929321;
                notBefore: 1742929321;
                exp: 1742932921;
                jwtId: 'b3e945c1-8d23-4a32-9f3a-7a5e8c1092b1';
                yourself.

  self
    assert: claimSet issuer equals: 'https://auth.example.com';
    assert: claimSet subject equals: 'user_987654321';
    assert: claimSet audiences equals: 'https://api.example.com';
    assert: claimSet issuedAt equals: 1742929321;
    assert: claimSet notBefore equals: 1742929321;
    assert: claimSet exp equals: 1742932921;
    assert: claimSet jwtId equals: 'b3e945c1-8d23-4a32-9f3a-7a5e8c1092b1'
]

{ #category : 'tests' }
JWTClaimsSetTest >> testAsJson [

  | claimSet |
  claimSet := JWTClaimsSet new
                issuer: 'https://auth.example.com';
                subject: 'user_987654321';
                audiences: 'https://api.example.com';
                issuedAt: 1742929321;
                notBefore: 1742929321;
                expirationTime: 1742932921;
                jwtId: 'b3e945c1-8d23-4a32-9f3a-7a5e8c1092b1';
                authorizedParty: '79v2n8m1k9l0p4q5r6s7t8u9v0';
                nonce: 'n-0S6_WzA2Mj';
                authTime: 1774476000;
                authenticationContextClassReference: 'urn:mace:incommon:iap:silver';
                authenticationMethodsReference: #( 'pwd' 'otp' );
                yourself.

  self
    assert: claimSet asJson
    equals:
    '{"iss":"https://auth.example.com","sub":"user_987654321","aud":"https://api.example.com","iat":1742929321,"nbf":1742929321,"exp":1742932921,"jti":"b3e945c1-8d23-4a32-9f3a-7a5e8c1092b1","azp":"79v2n8m1k9l0p4q5r6s7t8u9v0","nonce":"n-0S6_WzA2Mj","auth_time":1774476000,"acr":"urn:mace:incommon:iap:silver","amr":["pwd","otp"]}'
]

{ #category : 'tests' }
JWTClaimsSetTest >> testMimeType [

  self assert: JWTClaimsSet new mimeType equals: 'JWT'
]

{ #category : 'tests' }
JWTClaimsSetTest >> testOpenIDConnectClaims [

  | claimSet |
  claimSet := JWTClaimsSet new
                authorizedParty: '79v2n8m1k9l0p4q5r6s7t8u9v0';
                nonce: 'n-0S6_WzA2Mj';
                authTime: 1774476000;
                authenticationContextClassReference: 'urn:mace:incommon:iap:silver';
                authenticationMethodsReference: #( 'pwd' 'otp' );
                yourself.

  self
    assert: claimSet authorizedParty equals: '79v2n8m1k9l0p4q5r6s7t8u9v0';
    assert: claimSet nonce equals: 'n-0S6_WzA2Mj';
    assert: claimSet authTime equals: 1774476000;
    assert: claimSet authenticationContextClassReference equals: 'urn:mace:incommon:iap:silver';
    assert: claimSet authenticationMethodsReference equals: #( 'pwd' 'otp' )
]

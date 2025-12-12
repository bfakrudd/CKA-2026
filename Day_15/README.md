- How SSL works 
   - https://www.youtube.com/watch?v=0yw-z6f7Mb4
   - https://www.youtube.com/watch?v=EnY6fSng3Ew

- How to self sign certificate:
   -  https://letsencrypt.org/docs/certificates-for-localhost/

- 🔒 Symmetric Key

Only one key is used.

The same key is used for both encryption and decryption.

Both server and client must have the same key, so it must somehow be shared securely.

Fast, but key sharing is risky.

- 🔐 Asymmetric Key (Public–Private Key Pair)

   - Public Key → used to encrypt data.

   - Private Key → used to decrypt data (kept secret on the server).

How it’s used:

Server sends its public key to the client.

Client encrypts a random key (pre-master secret) using the server’s public key.

Server decrypts it with its private key.

Now both client and server have the same key → this becomes the session key (symmetric key).

This enables secure symmetric encryption afterward.

- ⚠️ But this alone is vulnerable

A hacker or “man in the middle” can:

Intercept the public key

Replace it with their own

Decrypt your messages and re-encrypt them

This is why authentication is required.

- 🔏 This is where SSL/TLS comes in

SSL/TLS solves the “Who are you?” problem using certificates.

📄 CSR (Certificate Signing Request)

When a server wants to prove its identity, it creates a CSR that contains:

Its public key

Its domain name

Organization details

The server signs the CSR using its private key, and sends it to a Certificate Authority (CA).

- 🏛️ What the CA does

The CA verifies:

The server owns the domain

The organization is legitimate

Then the CA signs the server’s public key with the CA’s private key.

This creates the SSL certificate.

🔐 What is inside the Certificate?

A certificate contains:

Server’s public key

Server’s domain name

CA’s digital signature (signed using CA’s private key)

👉 Important Correction:
The signature is NOT “public key of server + public key of CA”.
It is:

Signature = Hash(server public key + server identity) encrypted with CA’s private key
- 🖥️ How the client verifies the certificate

Server sends the certificate to the client (browser).

Browser uses the CA’s public key (already stored in the OS/browser) to verify the CA’s signature.

If the signature matches, the browser knows:

“This server’s identity is verified by a trusted CA.”

Then the browser safely sends the encrypted symmetric key.

This prevents man-in-the-middle attacks.

✔️ Final Summary
Before SSL

Anyone can pretend to be the server by giving a fake public key.

With SSL

A trusted CA signs the server’s public key.

Browsers trust that CA.

Client can confirm the server is real.

Then the encrypted key exchange happens securely.

Symmetric encryption is used for fast data transfer.

Crisp Summary:
===============
SSL/TLS = Authentication + Secure Key Exchange + Encrypted Communication

Asymmetric keys provide secure authentication & key exchange

Symmetric keys provide fast encrypted data transfer

Certificates ensure the server is genuine and trusted

- chain of trusts/certificate 
    - Root certificate 
    - Intermediate certificate Authority 
    - server certificate 


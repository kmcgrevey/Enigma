# Enigma
### CLI Codes
simplecov command:
* `open coverage/index.html`

to encrypt a message:
* format: `<runner_file.rb> <read_file> <write_file> <key> <date>`
* `ruby ./lib/encrypt.rb message.txt encrypted.txt`
* **_note:_** `key` and `date` will be generated if no default given

to decrypt a message:
* format: `<runner_file.rb> <read_file> <write_file> <key> <date>`
* `ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818`
* **_note:_** `key` and `date` must match `encrypt` codes

### Self-Evaluation
**Functionality:** 3

**Object Oriented Programming:** 3

**Ruby Convention and Mechanics:** 3

**Test Driven Development:** 3

**Version Control:** 4

**_TOTAL_:** 3.2

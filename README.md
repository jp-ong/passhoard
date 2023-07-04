# Passhoard

#### User Stories

- [ ] Generate a highly secure password and label it with a name.
- [ ] Retrieve a password from the list of saved passwords.
- [ ] Generate a QR code that contains the password.
- [ ] Copy the password to clipboard.
- [ ] Delete a password entry.
- [ ] Add an existing password by manually entering the password or by scanning a QR code.
- [ ] Nominate a key to be used for encrypting passwords.
- [ ] Modify the encryption key.

#### Requirements

- [ ] Application must never require internet connection.
- [ ] Application must be locked behind a PIN.
- [ ] Passwords must be encrypted with the PIN.
- [ ] PIN must be hashed when stored locally.
- [ ] List of passwords must display only their names, never their values.
- [ ] Passwords must be locked behind local authentication.

#### Pages

- [ ] **Onboard**
  - [ ] Nominate PIN / Password
  - [ ] Enable Biometrics
- [ ] **Login**
  - [ ] Enter PIN / Password / Biometrics
- [ ] **List**
  - [ ] List of passwords
  - [ ] Search / Sort
- [ ] **Summary**
  - [ ] Name of password
  - [ ] Value of password
  - [ ] Actions
    - [ ] Copy-to-Clipboard
    - [ ] Generate QR code
    - [ ] Modify name and value
    - [ ] Delete
- [ ] **Settings**
  - [ ] Change PIN
  - [ ] Enable / Disable Biometric Authentication
- [ ] **New**
  - [ ] Set up manually
    - [ ] Enter Password
    - [ ] Enter Name

# Checks - 01.01.2001

Things to check before dev branch is merged to master:

## Functionality Checks:  
### Account Checks:  
- [ ] Registration works
- [ ] Login works
- [ ] User is restricted by password-requirements when creating account
- [ ] User can't create account with too long username
- [ ] User can't create account with too short username
- [ ] User can't create account with invalid email
- [ ] All DB-entries are correctly created:
    - [ ] Username
    - [ ] Displayname
    - [ ] E-Mail adress
    - [ ] Hashed Password
    - [ ] Password Salt
    - [ ] Account version

### Settings Checks:
- [ ] Settings can be changed, and are reloaded correct
- [ ] Mail can be changed
- [ ] User can change account details:
    - [ ] Can change username
        - [ ] Can't change to too long username
        - [ ] Can't change to too short username
    - [ ] Can change email
        - [ ] Can't change to invalid email
    - [ ] All DB-entries are correctly changed:
        - [ ] Username
        - [ ] Displayname
        - [ ] E-Mail adress
        - [ ] Hashed Password
        - [ ] Password Salt
        - [ ] Account version

### Misc Checks:
- [ ] Check if the support formular works

## Other Checks:
- [ ] Changelog has been added
- [ ] Version number has been updated
- [ ] App works when completely deleted and copied from source
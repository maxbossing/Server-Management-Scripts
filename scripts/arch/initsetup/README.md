# initsetup

This Script will setup a fresh GNU/Linux Arch machine for production/development use 
> ### NOTE: This Script is only meant for use in the RedstoneGames.ch Production/Development Environment,
> ### using it somewhere else could result in unexpected behavior

---

### **Usage**

**Syntax** : *setup.sh [argument]*  
<br>
**Options**:
+ *--help -h*  
    > Prints Help Screen 
+ *--init -i*
    > starts the actual setup

---

### **Verify the integrity of the Script**
1. Download SHA256SUM and SHA256SUM.asc from the repository
2. Execute  
```
gpg --verify SHA256SUM.asc
```
3. If the output looks something like the inferior, continue. If not, redownload and recheck or open an issue
```
gpg: Signature made Di 25 Okt 2022 21:05:09 CEST
gpg:                using RSA key 64B333550486978BF63E54E4E2E95E80A0C1217E
gpg: Good signature from "Max Bossing <info@maxbossing.de>" [ultimate]
gpg: WARNING: not a detached signature; file 'SHA256SUM' was NOT verified!
```
4. Execute
```
sha256sum setup.sh && sha256sum -c SHA256SUM
```
5. If the outputs looks like the inferior, youre good to go. If not, redownload and recheck or open an issue 
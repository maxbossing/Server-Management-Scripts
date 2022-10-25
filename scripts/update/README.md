# initsetup

This Script will update a GNU/Linux Arch machine for production/development use 
> ### NOTE: This Script is only meant for use in the RedstoneGames.ch Production/Development Environment,
> ### using it somewhere else could result in unexpected behavior

---

### **Usage**

**Syntax** : *update.sh [argument]*  
<br>
**Options**:
+ *--help -h*  
    > Prints Help Screen 


---

### **Verify the integrity of the Script**
1. Download SHA256SUM, SHA256SUM.asc, and pub.key from the repository
2. Import pub.key in the gpg keyring and trust it with
```
gpg --import pub.key
gpg --edit-key info@maxbossing.de
trust
5
y
```
3. Execute  
```
gpg --verify SHA256SUM.asc
```
4. If the output looks something like the inferior, continue. If not, redownload and recheck or open an issue
```
gpg: Signature made Di 25 Okt 2022 21:05:09 CEST
gpg:                using RSA key 64B333550486978BF63E54E4E2E95E80A0C1217E
gpg: Good signature from "Max Bossing <info@maxbossing.de>" [ultimate]
gpg: WARNING: not a detached signature; file 'SHA256SUM' was NOT verified!
```
5. Execute
```
sha256sum update.sh && sha256sum -c SHA256SUM
```
6. If the outputs looks like the inferior, youre good to go. If not, redownload and recheck or open an issue 
```
a3ff3385ee06f80f403a754270a8ff4f5b67e0e51d30f5ef8a7fe843af3471e1  update.sh
update.sh: OK
```

---

### **Bug Report**

If you find any Bugs in this Script, feel free to open an issue 
# mkserver

setup a Minecraft server

---
### **Features**

+ Automated setup of Paper Servers
+ Automated setup of Velocity Servers
+ Automated setup of Bungeecord Servers

#### **Planned**

+ Auto-update 
+ Automatic deployment of:
    + whitelist.json
    + banned-players.json/banned-ips.json
    + ops.json
    + preset worlds
+ modification of server.properties/spigot.yml via command-line-arguments    
+ Progress bars

---
### **Known Bugs**

+ if no ```M``` or ```G``` is added at the end of the --min/--max argument, the server will not start
+ ```start``` and ```server.jar``` are not automatically flagged as executable

---

### **Verify the Integrity**

Execute

```bash
sha256sum -c sha256sum
```

If it looks like this output, continue

```txt
mkserver : OK
```

---
### **Usage**

from ```mkserver -h ```:

```txt
usage: mkserver [-h] --min MIN --max MAX name path {paper, bungeecord, velocity}

setup a minecraft server

positional arguments:
    name
    path
    {paper, bungeecord, velocity}

options:
    -h , --help     show this message and exit
    --min MIN       Minimal amount of RAM
    --max MAX       Maximal amount of RAM
```

#### Deeper explanation

+ **```-h, --help```**:
    > Print help screen
+ **```--min MIN```**:
    > Minimal amount of RAM the server should use. Must be followed by ```M``` or ```G```  

    > Mandatory
+ **```--max MAX```**:
    > Maximal amount of RAM the server should use. Must be followed by ```M``` or ```G``` 

    > Mandatory
+ **_```name```_**:
    > The name the server should have. Will be the screen name  

    > Mandatory
+ **_```path```_**:
    > Path to the server directory. should not exist already  

    > Mandatory
+ **_```{paper, bungeecord, velocity}```_**:
    > Server software which should be used  

    > **Possible options:**
    >   + ```paper```
    >   + ```velocity```
    >   + ```bungeecord``` 

    > Mandatory

##### **Example**:
```bash
mkserver --min 512M --max 1024M server /opt/server paper
```
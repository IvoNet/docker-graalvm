# GraalVM docker image

Docker image containing the Community Edition of GraalVM with the extra languages enabled. 
Maven 3.6.1 is also added for easy use in projects

This image is completely based on the official oracle/graalvm builds and follows the same versioning system.
It only fixes some settings like GRAALVM_HOME and activates the other languages making it more developer friendly.

## Example(s)

### quarkus:dev
The command below will run `mvn compile quarkus:dev` from
the current folder mapping the local maven repository as a volume
and exposing two ports for easy usage outside the container.

The compiling and running will happen against the GraalVM in the container.

* Quarkus dev mode build

### Dev mode

```bash
docker run                    \
  -it                         \
  --rm                        \
  -v "$(pwd):/project"        \
  -v "${HOME}/.m2:/root/.m2"  \
  -p 8080:8080                \
  ivonet/graalvm:1.0.0-rc16   \
  mvn compile quarkus:dev
```

### native-image build

```bash
docker run                    \
  -it                         \
  --rm                        \
  -v "$(pwd):/project"        \
  -v "${HOME}/.m2:/root/.m2"  \
  -p 8080:8080                \
  ivonet/graalvm:1.0.0-rc16   \
  mvn package -Pnative
```

### runnen native-image build

```bash
docker run                   \
  -it                        \
  --rm                       \
  --name graalvm             \
  -v "$(pwd):/project"       \
  -p 8080:8080               \
  -v "${HOME}/.m2:/root/.m2" \
  ivonet/graalvm:1.0.0-rc16  \
  ./target/getting-started-1.0-SNAPSHOT-runner  
```

### GraalVM as interactive shell

```bash
docker run                    \
  -it                         \
  --rm                        \
  -v "$(pwd):/project"        \
  -v "${HOME}/.m2:/root/.m2"  \
  -p 8080:8080                \
  ivonet/graalvm:1.0.0-rc16   \
  /bin/sh
```




---
# License

    Copyright 2019 (c) Ivo Woltring

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


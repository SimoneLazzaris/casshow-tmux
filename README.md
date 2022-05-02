## License

Copyright 2022 CodeNotary, Inc. All rights reserved.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
	http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


## requirements
- dialog
- tmux
- nnn (optional)

On debian, you'll need to install those packages:
```
apt-get install tmux dialog nnn
```
On macos, you can easily install all dependencies using brew.

## Configuration
Please edit file `env.sh` according to your system configuration:
- set ASSET variable to the full path of your asset to notarize
- uncomment and set CAS_API_KEY.

You can also set `CAS_API_KEY=api_key_value` in a separate `cas_key` file

## Docker

You can easily build a docker container to pack every requirement in a single image.
```sh
docker build -t casshow:latest .
```

To run it:
```sh
docker run -it --rm cas:latest -e CAS_API_KEY=api_key_value
```

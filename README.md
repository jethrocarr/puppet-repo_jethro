# Puppet Module for Pupistry

This is a companion module for Pupistry deployments. If you are using Pupistry,
it is recommended you add this module to all your nodes to make Puppet work
smoothly in masterful mode.

Please see https://github.com/jethrocarr/pupistry for more details.


# What it does

Whilst Pupistry does most of the heavy lifting we need, this module helps
out by adding functionality lost when in masterlesss mode (like pluginsync)
and sets up Pupistry daemon for background application of new Puppet config.

It isn't mandatory, you can use Pupistry without it if you take steps to add
the bits you need/want to your own manifests.


# Configuration

This module sets Pupistry up with various sensible defaults including
installation of the daemon and ensuring latest version installed via Rubygems.

If you wish to change any behaviors, just review the configuration in
`manifests/params.pp` and create an override entry in Hiera - no need to have
to fork the module.

Example of override in Hiera to disable daemon:

    pupistry::install_daemon: false

Overrides that should impact all systems can go into common.yaml, otherwise
just selectively put the override into the most appropiate YAML file for your
layout.


# License

Pupistry is licensed under the Apache License, Version 2.0 (the "License").
See the LICENSE.txt or http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


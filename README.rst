=======================
Concourse-CI Playground
=======================

Set up
======
1. `Install docker <https://www.docker.com/products/docker>`_
2. `Install docker-compose <https://docs.docker.com/compose/install/>`_
3. Generate SSH Keys
4. Start up the environment
5. Verify

Generate SSH Keys
-----------------
::

   $ mkdir keys
   $ cd keys
   $ ssh-keygen -t rsa -f host_key -N ''
   $ ssh-keygen -t rsa -f worker_key -N ''
   $ ssh-keygen -t rsa -f session_signing_key -N ''
   $ cat worker_key.pub >> authorized_keys

Start up the Environment
------------------------
::

   $ docker-compose up -d --scale worker=3

Verify
------
1. Open up the `Concourse UI <http://127.0.0.1:9999/>`_
2. Download the CLI from the links on the lower right-hand side
   of the UI.
3. Create and run the sample job::

      $ ./fly login -t verify -c http://127.0.0.1:9999 --username=me --password=secret
      target saved

      $ ./fly -t verify set-pipeline -p hello -c examples/hello.yml -n
      targeting http://127.0.0.1:9999

      jobs:
        job hello-world has been added:
          name: hello-world
          plan:
          - task: say-hello
            config:
              platform: linux
              image_resource:
                type: docker-image
                source:
                  repository: alpine
              run:
                path: echo
                args:
                - hello
                - world
                dir: ""

      pipeline created!
      you can view your pipeline here: http://127.0.0.1:9999/pipelines/hello

      the pipeline is currently paused. to unpause, either:
        - run the unpause-pipeline command
        - click play next to the pipeline in the web ui

      $ ./fly -t verify unpause-pipeline -p hello
      targeting http://127.0.0.1:9999

      unpaused 'hello'

      $ ./fly -t verify trigger-job -j hello/hello-world
      targeting http://127.0.0.1:9999

      started hello/hello-world #1

      $ ./fly -t verify builds
      targeting http://127.0.0.1:9999

      id  pipeline/job       build  status     start                     end                       duration
      17  hello/hello-world  1      succeeded  2016-07-22@10:28:27-0400  2016-07-22@10:28:37-0400  10s

What you have in front of you
=============================
- A single scheduler running at ``http://127.0.0.1:9999``
- Three workers
- Data stored in standalone postgres instance

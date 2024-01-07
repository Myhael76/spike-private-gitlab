# GitLab on Docker Compose

This is a spike feature. The initial purpose is to establish:

1. What is the latest supported Ubuntu OS
2. Resolve dependencies
3. Validate capabilities
   1. dynamic runners
   2. avoid `dind` - Docker in Docker, prefer `bind` - Buildah in Docker
4. Check backup and restore

## Chapter 1 - Study docker compose with Rancher

The idea is that is docker compose is ok, the underlying OS doesn't matter for any aspect that is different from the kernel.

Found a recent [how-to](https://www.atlantic.net/dedicated-server-hosting/how-to-install-gitlab-with-docker-and-docker-compose-on-arch-linux/) from Atlantic Net.

Referred images are fairly recent, however, the proposed arrangement is not very secure. It uses root as default user and it mounts the docker socket.
This might be OK if you use dedicated boxes, but if the containers live in a shared infrastructure this arrangement cannot be considered sufficient from a security perspective.

Something is not right in the above example. The [Gitlab documentation](https://docs.gitlab.com/ee/install/docker.html) mentions an "ee" edition. 

Links from dockerHub to documentation are broken.

[Seems like ee is the way to go](https://about.gitlab.com/install/ce-or-ee/), has a free tier and is upgradeable to supported in the future.

This is the [official manual to work with docker](https://docs.gitlab.com/ee/install/docker.html). Key points:
   - it uses the hostname, set one appropriately and do not use localhost

Another [note from GitLab forums](https://forum.gitlab.com/t/example-gitlab-runner-docker-compose-configuration/67344).
   
Conclusions after part 1 of the study:

- This stage of the spike finishes with the arrangement in the "GitLabSoluzioneZero" folder.
- For a quick start use the images provided by GitLab. It is possible to build a more refined deployment, but it requires some serious knowledge of the product.
- The "solution zero" deployment my be sufficient for a small project or somebody that just starts with GitLab. It may be enforced a bit if installed in a dedicated linux box on a local LAN, but it should not be considered a secure solution to be deployed on the internet.
- It seems GitLab is only offering documentation for docker with full privileges and the offered images are running as root. It might be interesting to study ho to enforce, but with the current knowledge it seems an expensive endeavor.


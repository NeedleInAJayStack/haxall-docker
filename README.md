# Haxall Docker

This contains a dockerfile that generates Haxall docker images.

## Usage:

To run an image, run:

```bash
docker run -p 8080:8080 -v ~/haxall/proj:/opt/haxall/proj -e "SU_PASS=changeme" haxall-docker
```

### Data Persistence

This image expects a volume mount at `/opt/haxall/proj/`. This is expected to be the root of a Haxall project or an 
empty directory. If the directory is empty, then a new project is initialized using the configuration documented below.

### Configuration

#### Initialization

The environment variables below are only used when initializing new projects:
- **SU_PASS**: Required. The super-user password.
- **SU_USER**: Optional. The super-user username. Defaults to `su`.


## Building

To build, run:

```bash
docker build --tag haxall-docker .
```


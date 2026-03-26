# OpenClinic Docker

Docker image for [OpenClinic GA](https://sourceforge.net/projects/openclinic-ga/), a free open-source hospital information management system.

## Build

```bash
docker build -t openclinic .
```

## Run

```bash
docker run -d \
  --name openclinic \
  -p 10088:10088 \
  openclinic
```

Access the application at: http://localhost:10088

## Configuration

The following environment variables can be passed at runtime:

| Variable   | Default | Description              |
|------------|---------|--------------------------|
| `LANGUAGE` | `EN`    | Interface language       |
| `COUNTRY`  | `EN`    | Country configuration    |

Les valeurs possibles: AL,BE,BD,BF,BI,BR,CD,CG,CI,CM,EN,ES,FR,GA,GN,KE,LK,ML,NE,NG,NL,PE,PT,RW,SN,TZ,UG or ZM

Example with custom configuration:

```bash
docker run -d \
  --name openclinic \
  -p 10088:10088 \
  -e LANGUAGE=FR \
  -e COUNTRY=FR \
  openclinic
```

> Note: Language and country are applied on first startup only.

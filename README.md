# step21/fritz-mrtg


Docker instance to run [MRTG](https://oss.oetiker.ch/mrtg/) with a fritzbox from avm - The Multi Router Traffic Grapher. It is based on [dckr-mrtg from fboaventura/dckr-mrtg](https://www.github.com/fboaventura/dckr-mrtg) and uses https://github.com/MStrecke/ng-upnp2mrtg to convert upnp data from the fritzbox for mrtg.

I would suggest to use the supplied docker-compose.yml or to adapt it to your needs.

Once the instance is running, all you have to do is open a web browser and point it to `http://localhost:8080`


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fstep21%2Ffritz-mrtg.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fstep21%2Ffritz-mrtg?ref=badge_large)

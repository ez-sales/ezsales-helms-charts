## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```helm repo add ezsales https://helm.ez-sales.eu```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
ezsales` to see the charts.


### To install the ezsales-mkp-front chart:

```helm install my-ezsales-mkp-front ezsales/ezsales-mkp-front```

To uninstall the chart:

```helm delete my-ezsales-mkp-front```
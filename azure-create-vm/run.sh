export RESOURCE_GROUP_NAME=dev-vms
export LOCATION=uksouth
export VM_NAME=johnwalker
export VM_IMAGE=Ubuntu2204
export ADMIN_USERNAME=johnwalker

https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-cli

az group create --name dev-vms --location uksouth --subscription ${SUBSCRIPTION}

ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa
chmod 700 .ssh && chmod 600 .ssh/*

az vm create \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $VM_NAME \
  --image $VM_IMAGE \
  --os-disk-size-gb 128 \
  --admin-username $ADMIN_USERNAME \
  --size Standard_D2s_v4 \
  --public-ip-sku Standard \
  --ssh-key-values .ssh/id_rsa.pub \
  --security-type 'TrustedLaunch' \
  --enable-secure-boot true \
  --enable-vtpm true \
  --subscription ${AZURE_SUBSCRIPTION}


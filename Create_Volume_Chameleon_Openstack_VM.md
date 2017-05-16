# Create and attach a Volume in Chameleon Openstack VM. 
### Backup your data people :)

### Step 1:
First, you need to create a volume by going into your respective projects in Chameleon, choosing `Volume` from `Compute` Menu and choosing `+Create Volume`.

Once you have created a volume, attach it to an instance using the drop down menu towards the right and selecting `Manage Attachement`. 

After attaching the Volume, you will get a device name. The device name can be seen under `Attached to` field. 

For example: `Attached to Arun_MPI_Learning_Node_3 on /dev/vdb`. Here `/dev/vdb` is the device name. Keep a note of it, we need it in the next step.

### Step 2:
Make sure the volume is attached.
```
sudo file -s /dev/vdb
```
This command should give you a similar output:
```
/dev/vdb: Linux rev 1.0 ext4 filesystem data, UUID=49995f73-b1a9-412a-abec-9d6cf4d4d269 (needs journal recovery) (extents) (large files) (huge files)
```
If you do not get a similar output, you need to create a new file system by formating the volume. To create a new file system:
```
sudo mkfs -t ext4 /dev/vdb
```
### Step 3:
Create a new folder to mount the volume.
```
sudo mkdir /mount_point
```
### Step 4:
Backup and copy new lines to /etc/fstab
```
sudo cp /etc/fstab /etc/fstab.orig
```
Open `/etc/fstab` in a text editor (`sudo vi /etc/fstab` for example) and add this line.
```
/dev/vdb       /mount_point   ext4    defaults,nofail        0       2
```
### Step 5:
Mount the volume and give proper rights
```
mount -a
sudo chown $USER:$USER -R /mount_point
```
### Step 6:
Confirm volume by creating a test file in it.
```
touch /mount_point/testing_volume.txt
cd /mount_point/
ls
```

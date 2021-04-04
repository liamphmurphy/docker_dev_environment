# remembering how to run docker commands is hard, let's make this easy

container_name=archenv

if ! grep -q "microsoft" /proc/version; then
	volumes=(/mnt/9018ECA118EC8794/projects)
else
	volumes=(/mnt/d/projects)
fi

# docker build, assumes Dockerfile is in the present directory from execution
docker build -t $container_name -f Dockerfile  .

volume_string=""
# build volume argument string
for volume in "${volumes[@]}"
do
	echo $volume
	volume_string+=" -v ${volume}:/mnt/projects/"
done

# start container
docker run --network host $volume_string -it $container_name bash

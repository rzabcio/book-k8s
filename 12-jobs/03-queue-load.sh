curl -X PUT localhost:30080/memq/server/queues/keygen
for i in work-item-{0..99}; do
	curl -X POST localhost:30080/memq/server/queues/keygen/enqueue -d "$i"
done

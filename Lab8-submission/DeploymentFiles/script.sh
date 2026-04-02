# 1. Restart secondary pods
echo "Restarting secondary pods..."
kubectl delete pod mongodb-1 mongodb-2

# 2. Wait for them to be ready
echo "Waiting for pods to be ready..."
sleep 45

# 3. Reconfigure to single member
echo "Reconfiguring to single member..."
kubectl exec mongodb-0 -- mongo --eval 'rs.reconfig({_id: "rs0", members: [{_id: 0, host: "mongodb-0:27017"}]}, {force: true})'

# 4. Wait for reconfig to settle
sleep 10

# 5. Add second member
echo "Adding mongodb-1..."
kubectl exec mongodb-0 -- mongo --eval 'rs.add("mongodb-1.mongodb:27017")'

# 6. Wait a bit
sleep 10

# 7. Add third member
echo "Adding mongodb-2..."
kubectl exec mongodb-0 -- mongo --eval 'rs.add("mongodb-2.mongodb:27017")'

# 8. Wait for stabilization
sleep 15

# 9. Check final status
echo "Final replica set status:"
kubectl exec mongodb-0 -- mongo --eval "rs.status().members.forEach(m => print(m.name + ': ' + m.stateStr))" --quiet

# 10. Check all pods
echo -e "\nAll pods:"
kubectl get pods
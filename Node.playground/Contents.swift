//: Playground - noun: a place where people can play

import Foundation

class Solution1{
    class Node{
        var value:Int!
        var leftChild:Node?
        var rightChild:Node?
        
        init(_ value:Int){
            self.value = value
        }
    }
    
    
    func isBinarySearchTree(_ node:Node, greaterThan:Int? = nil, lessThan:Int? = nil) -> Bool{
        
        if let lessThan = lessThan, node.value >= lessThan{
            return false
        }
        
        if let greaterThan = greaterThan, node.value <= greaterThan{
            return false
        }
        
        if let leftChild = node.leftChild{
            if leftChild.value >= node.value { return false }
            let result = isBinarySearchTree(leftChild, greaterThan: greaterThan, lessThan: node.value)
            if !result { return false }
        }
        
        if let rightChild = node.rightChild{
            if rightChild.value <= node.value { return false }
            let result = isBinarySearchTree(rightChild, greaterThan: node.value, lessThan: lessThan)
            if !result { return false }
        }
        
        return true
        
    }
}

class Solution2{
    class Node{
        var value:Int!
        var next:Node?
        
        init(_ value:Int){
            self.value = value
        }
    }
    
    func isContainsCycle(_ node:Node) -> Bool{
        var currentNode = node
        var allNodes = [Node]()
        while currentNode.next != nil {
            if (allNodes.filter{ $0 === currentNode }.count > 1){ return true }
            allNodes.append(currentNode)
            currentNode = currentNode.next!
        }
        return false
    }
}

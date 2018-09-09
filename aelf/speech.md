Good evening everyone! Thanks for coming to our meetup. Here's the agenda for today.
Today's talk is about the technology in aelf. Before deep diving into the techincal details, I'm going to touch on the high level ideas. Like what is aelf and what are the problems aelf is trying to solve and what are the design principles of aelf.

## Slide 1

* Firstly what is aelf? In one sentence, we can describe aelf as a public blockchain platform whose production nodes will run in clusters. Basically, it means that an aelf node is a cluster of computers instead of a single computer. And in most cases these clusters will be in a cloud.
* Why do we adopt such a strategy? Here is our belief and reasoning.
    1. First, we believe blockchain is going to transform many industries. I believe this is also the reason why there are tens of millions of people worldwide who are investing in cryptocurrencies. I believe share this same vision.
    1. Then we gotta ask a question: __how will the blockchain technology transform the existing industries or even perhaps create new forms of businesses?__ We are yet to work that out by collaborating with everyone who cares about block. But there's one thing we can be sure of at this moment, by borrowing experiences from the development of the internet industry in the past decades. **We believe for blockchain technology to be successful, network effect is indispensible.** To have greater network effect, we need to have hundreds or even thousands of dapps running in the same ecosystem. That means the blockchain infrasture has to be able to support all these dapps, where each dapp may have millions of users.
    * To make such a large scale network infrastructure. We have to make use of technologies and experiences  accumulated from decades of practices in centralized IT systems.

This is the principle we hold when designing aelf's software.

## Slide 2

To make blockchain technoloy userful, aelf has identified three main problems that we need to solve at this stage. **Namely resource segregation, processing performance,and governance.**
    1. Firstly, resource segregation. Dapps running on blockchain platform has different set of requirements with regards to resources like storage, computing power, and network. **Resource segregation** has to be possible so that dapps or groups of dapps can co-exist on a blockchain ecosystem without forcing them to fight for shared resources.
    **For example**, you don't want your insurance transaction to remain in the transaction pool without being processed due to the congestion caused by a sudden popular game on the network.
    1. The second problem is processing performance. You want the scalability of the resources so that you have the capacity to meet the demand of the dapps and the users. Especially when the userbase grows significantly. You want your platform to be scalable.
    1. The third problem is governance. Blockchain is an open and decentralized platform. And once it's started, it has its own life. So the software has to support the self-evolving of the organism. The key to this problem is to have a mechanism for the stake holders to make desicions in a healthy and collaborative way so that decisions that are benificial to the whole ecosystem can be made. And when a decision is made, there is a way to automatically implement the updates or changes.

In the lower section of this slide, we list out the ingredients of aelf's solution to these problems.
1. We adopt DPOS consensus protocol. The stake holders cast votes to elect the delegate nodes who will help the users to execute the transactions, build or validate the new block and decides a canonical chain. The stake holders also vote to make decisions on the updates of the system contracts which defines the rules how the chain works. In this way, no hardfork is required if rules are to be changed.

    DPOS also helps in improving the processing speed of transactions as the production schedule is predetermined and predictable. (To clarify)

1. aelf has a unique main chain plus multiple side chains architecture. **This mainly helps in resource segregation.** The side chains are designed to serve one particular business scenario. Each side chain has its own dedicated set of resources.
    In some sense, it also helps improve the performance, as the side chains won't interfere with each other, congestion on one side chain has no effect on the others.
    The job of the main chain is to index the blocks produced by the side chains and facilitate the cross chain communication.
1. Besides that, aelf is working to enable parallel processing for smart contract executions. As some contracts are so popular that there are too many users sending transactions to it in every block. By enabling parallel processing, multiple transactions to the same contract can be exected at the same time without being constrained by the processing power of a single computer.
1. Next is modularization. We try to make all the components modular and decoupled so that we can scale out the individual components when it becomes the bottleneck.
1. Last but not least, aelf's component reside on cluster of computers. Together with modularization, it enables scalability of each component.


## Slide 3

Now let's talk about the technical details on the implementation of some of these ideas.

* For DPOS consensus, initially we'll have 17 delegate nodes and the number will increase by 2 every year.
* The production of the blocks are broken down into rounds and in each round every delegate nodes will be assigned a timeslot for it to process transactions and build a new block.
* The order of the delegate nodes are randomized. Basically, every delegate node will have to generate one random value as a seed to calculate its timeslot in the next roung. The random number here is called the "in" value. These "in" values are kept secret so each delegate node only knows its own "in" value. However, the hash of the "in" value will be revealed. In this way, the "in" value cannot be changed once picked. The "in" values will be published after the round has finished which means 17 blocks have been produced if we talk about the first year. An additional block will be produced by a randomly chosen delegate. In this block, an operation called pre-verification is done. Pre-verification is to check the published "in" value generate a hash same as the one published before. The order of the next round will be derived from these "in" values. In this way, each delegate node contribute some randomness in the whole process.
* Some people say that consensus protocol is the soul of a blockchain. Now, let's look at the body of the blockchain.

## Slide 4

To help make more sense of our architecture, in this slide, we make a comparison of what's inside an Ethereum node vs what's inside an aelf Node.

* In an ethereum node, all the components including:
    1. a p2p network for handling the actual traffic.
    1. A miner that schedules the production of the blocks.
    1. A worker that performs the dirty work of executing the transactions.
    1. And of course the database that stores the state data and other data.

    All these components reside in one process - a single piece of program.

* In contrast, an aelf node although it's called a node, it's actually a cluster of computers instead of a single computer.

    Besides the main program handling the network and mining schedule. The other components DB and workers are scalable cluster of computers.

    This architecture provides a few advantages:

    1. 1st, it enables us to process the transactions in parallel as we have multiple workers which can handle multiple transactions at the same time.

    1. 2nd, both the db cluster and worker cluster can be easily scaled. The capacity of the platform can be easily adjusted to meet the increasing demand.

    1. 3rd, it enables us to monitor the performance of each component separately and optimize their performance separately.

## Slide 5
Next, let's see how the concept of parallel processing is realized in the platform. We can think that there are two layers of parallel processing in aelf platform.
1. The side chains can be thought as the design time parallelism. By applying their pre-existing knowledge about the business nature, the developers will deploy related smart contracts on one side chain which specialized to serve that particular business scenario. Unrelated scenarios will run in parallel.

1. The next layer of parallelism is more of a runtime parallelism. This happens within a chain. Although transactions on one side chain may be related to another, most of the time they are not. Let's imagine an ecommerce dapp running on one side chain. It'll be too dumb to wait until Alice's order for facial masks to be processed before starting to process Bob's order for a book. So we believe unrelated transactions are the usual case. So it makes sense and worth the efforts to make parallel processing on the transaction level possible. For this type of parallelism, we have to analyse all the transactions and determine whether they have conflicts in data access. If they don't access the same piece of data, **the execution order doesn't change the execution results.**

## Slide 6
So this brings us to the next question, how do we know whether two transactions have conflicts in data access.

We can view a blockchain as a state transition machine upon valid transactions. So the main roles here are:
* a database keeping the state
* a smart contract defining the logics how the transitions will be performed
* and a transaction serving as the input and trigger of the transition

The data stored in the database are actually key-value pairs. While the data used in a smart contract are in the form of the in a class. Hence we need to have some kind of mapping from the smart contract fields to the key of the data stored in the database.

We define a logical middle man called the data provider to do the translation from the smart contract fields to database keys. There are two types of fields in smart contract. One of regular type which has a name and a value. The other type call the map type field is itself a key-value collection. One root data provider is assigned to a smart contract instance. It handles the translation for the regular fields. For a map field, the root data provider cannot generate a final key used for data storage. Instead it generates a sub data provider. The sub data provider needs the actual data key to finalize the mapping.

The result of the mapping is called a path. As it is constructed like a path on the file system. We call the data it points to in the database the Resource in the context of parallel processing.

* For a regular field, it has a full path consisting of the chain id, the contract address, the data provider name and the field name.

* For a map field, without runtime context, we can only generate a partial path pointing to a sub data provider. We need the actual key in the map to form the full path to be used by the data base.

The full path is as the identifier of the resource. We'll analyze the smart contract code to extract the collection of resources used by the contract. The full paths of the regular types can be extracted statically from the smart contract code.

However, for mapping type, we need the input from the transaction to form the full paths and hence the resource set. Once the full set of resources are identified. We can group the transactions by the resources used. Transactions with direct or indirect shared resources are assigned into the same group and the transactions in the same group will be executed sequentially, but independent groups can be executed in parallel.

A special case is when there is inline call to another contract. For such cases, we form a call graph in memory. The resource set caused by callee funtions will also be added to the resource set of the transaction.

## Slide 7
So in summary, the concepts related to parallel processing are.
1. Metadata: we extract meta data from the contract code, so that it can used to form the resource set and the call relationships.
1. call graph maintenance: there is a global call graph for each chain, and it's updated every time when there is and update of contract code or a deployment of a new contract
1. Resource identification: full resource set of each transaction are identified statically and dynamically. Where we a partial resource paths,  all addresses in a transaction are extracted and enxtended to every partial path, so that all possible resources are included.
1. Parallel execution of groups: unrelated groups are executed in parallel

## Slide 8
Next, let's see the process in action.

This is an example of a simplest token contract. It has a few regular fields recording the basic info of the token and a mapping field recording the balances of users. It has two methods. One for initializing the token info. One for transferring token from the a user to another. **This contract is not calling any other contract.**

In Initialize method, the info fields are intialized. They can only be intialized once and cannot be changed after initialization.
In here, you can see the parts that form the paths. The chain id 0x1234, the contract address 0xabcd, the data provider name. For the regular types, we have the the root data provider name, and the field names.

But for the transfer method, the field used is a map field, so we only have partial path to the resource, where the last part (the user account address) will be dynamically provided in transactions.

So for a transaction sending token from aaaa to bbbb. Two resource paths are retrieved by extending the partial path with the sender and receiver addresses.

## Slide 9
This is an example of a contract calling another contract. It's a crowd sale contract. By invoking the "Contribute" method, the user send native token to the contract address and his balance on this contract will be increased proportionally.

So for the "Contribute" metadata inludes not only the resource set but also a calling set with the `Transfer` method of the native token contract as the member. The callee method here is identified by the chain id, destination contract address and the method name. So for a method calling another, its full resource set has to include both the caller resource set and the callee resource set. In here, it means the user's balance on both the crowdsale token contract and the native token contract.

## Slide 10
This slide shows how we do the grouping of the transactions.

We have four transactions here. Let's see how the grouping is done when we add the transactions one after another.

The first transaction is tranfer 100 native token from 0xaaaa to 0xbbbb. So we have two resources in question here. One is the sender (user aaaa)'s balance on the native token contract (a), and the other user bbbb's balance on native token contract a.

Transaction 1 creates a link between these two resources. If there's more transaction accessing these two resources, they will be put in the same group as transaction 1.

Transaction 2 is a similar transaction from user cccc to user dddd. As sender and receiver don't overlap with those of transaction 1. The two resources creates another group.

Next we have another type of transaction which is not the native token transfer, but the crowdsale contribute. Let's say, in the same block, user aaaa wants to contribute to the crowdsale token. He sends a transaction to invoke the contribute method in contract c. And this transaction via function call accesses the native token balance of aaaa, hence transaction 3 creates a link between user aaaa's balance on contract a and his balance on contract c.

We continue to look for other transactions in the pool. Let's say, we found a transaction 4 of transferring native token from user cccc to  user aaaa. Now, we create a link between the two user's balances on the native token. In this case, we merged these two groups. Now we have only one group. We cannot process these transactions in parallel but can only process them sequentially.

## Slide 11
The idea of grouping may seem straight forward. However, in practice there are more to consider. And continuous improvements are required.

Here, we list out some considerations and improvements going on.

1. To lay out the foundation for the grouping, we need to extract the metadata from the contract. Hence, we have to restrict how the developers write the contract code. We provide the predefined classes in our sdk and developers have to use the provided classes so that the metadata can be correctly extracted for C# code.

1. Next, in the runtime, we have to make the time spent on grouping as small as possible so that we have less overhead and more time on the actual execution. We continuously optimizing the algorithm.

1. Besides the actual execution, there are other parts that can be done in parallel. A typical one is the validation of signature of the transactions. As we know, signing and validating the signature are very time consuming. However, it doesn't require access of state data. So we can separately handle signature validation and multiple transactions can be validated in parallel.

## Slide 12
Now let's move to the multi chain stuff. This diagram shows the overall structure of the multichain ecosystem. There is one main chain indexing the internal and external side chains. Cross chain communication is done via the main chain. Besides the standard internal side chains serving well defined purpose like token crowd funding, developers can also customize their side chains by choosing different consensus protocols, block headers and so on.

## Slide 13

Now let's move on to see how the indexing is performed within a merge-mining node. The indexing of the side chains is to facillitate the verification of the existence and execution order of the transactions. So for a user client, it doesn't need to connect to all the side chains, but the transactions on another side chain can be verified via the indexing information on the main chain.
The merge-mining node serves both the main chain and side chains. Miner is the module that handles the chain growing logics and schedules block producing activities. As the miners are internal to the node for a merge-mining node, they will exchange the block header information by mechanisms such as rpc. The main chain miner unpacks the block info of all the side chains and construct the main chain header. The side chains will retrieve back the mainchain header info to  prepare for cross chain verifications.

## Slide 14
As I have mentioned before, aelf's node is actually a cluster of machines. Now let's look at how's the actual deployment structure of the cluster. All the modules will run in containers, kubernetes is used to manage the containers. 

For those who's not familiar with kubernetes, Pod is the smallest management unit in kubernetes.

Each chain has its own pods for all the modules. Although all the modules for all the chains live in the same cluster, they are separate by chain-specific namespaces.

## Slide 15
Now let's look at the execution part of the cluster. As aelf's design is modularized, actually we can use different execution services. The current version of the software provide an execution service implemented in akka.net which is a distributed computing framework. By using akka.net, the execution service, although it is remotely deployed, it can be used as if it is a local service. The smallest logic unit in the akka cluster is called actor. So for a parallelly executed transactions, each actor will executed a group of transactions. For each akka cluster, there is a manager that starts the logical actor system. It handles the registration of the actors so that the their lifecycle can be supervised and the new tasks can be routed to them. Another concept here is the worker. A worker is a process running in a container that hosts multiple actors. In this way, some runtime resources can be shared by these actors.

As we have seen previously, the worker pods are managed by kubernetes and it can be automatically scaled when it's needed.

## Slide 16
This diagram shows the relationship between the kubernetes and the chain services under its management. By using Kubernetes API, the resources and health of the modules for all the chains can be monitored. And the resources for a new chain can be started when it's required.

## Slide 17

With that I conclude my talk today. Thank you all for your time. And I'm ready to take your questions.

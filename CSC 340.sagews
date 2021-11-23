︠f80ba5ab-b598-45ed-af9f-ebb938d9ae59︠

︡04f53b68-9516-4328-a1ca-d6f57f549fc4︡
︠a3d07455-1564-4a27-98cf-028df64964c7i︠
%md
# 23.1-2 Minimum Spanning Trees and the algorithms of Kruskal and Prim

#### Muthana, Sumit


## Spanning Trees


Electronic circuit designs often need to make the pins of several components electrically equivalent by wiring them together. To interconnect a set of n pins, we can use an arrangement of (n-1) wires, each connecting two pins. Of all such arrangements, the one that uses the least amount of wire is usually the most desirable.
We can model this wiring problem with a connected, undirected graph $G=(V,E)$, where V is the set of pins, E is the set of possible interconnections between pairs of pins, and for each edge $(u,v)∈ E$, we have a weight $w(u,v)$ specifying the cost (amount of wire needed) to connect $u$ and $v$. We then wish to find an acyclic subset $T ⊆ E$ that connects all of the vertices and whose total weight.

$w(T) = \displaystyle\sum_{(u,v)∈ T}w(u,v)$
is minimized. Since T is acyclic and connects all of the vertices, it must form a tree, which we call a **spanning tree** since it “spans” the graph G. We call the problem of determining the tree T the **minimum-spanning-tree problem.**


## Growing a minimum spanning tree

Assume that we have a connected, undirected graph $G=(V,E)$ with a weight function $W : E → R$, and we wish to find a minimum spanning tree for G. The two algorithms we consider in this chapter use a greedy approach to the problem, although they differ in how they apply this approach.

## Weight functions




︡9f93edc6-b44c-4565-821b-2991f9269a7b︡{"done":true,"md":"# 23.1-2 Minimum Spanning Trees and the algorithms of Kruskal and Prim\n\n#### Muthana, Sumit\n\n\n## Spanning Trees\n\n\nElectronic circuit designs often need to make the pins of several components electrically equivalent by wiring them together. To interconnect a set of n pins, we can use an arrangement of (n-1) wires, each connecting two pins. Of all such arrangements, the one that uses the least amount of wire is usually the most desirable.\nWe can model this wiring problem with a connected, undirected graph $G=(V,E)$, where V is the set of pins, E is the set of possible interconnections between pairs of pins, and for each edge $(u,v)∈ E$, we have a weight $w(u,v)$ specifying the cost (amount of wire needed) to connect $u$ and $v$. We then wish to find an acyclic subset $T ⊆ E$ that connects all of the vertices and whose total weight\n\n$w(T) = \\displaystyle\\sum_{(u,v)∈ T}w(u,v)$\nis minimized. Since T is acyclic and connects all of the vertices, it must form a tree, which we call a **spanning tree** since it “spans” the graph G. We call the problem of determining the tree T the **minimum-spanning-tree problem.**\n\n\n## Growing a minimum spanning tree\n\nAssume that we have a connected, undirected graph $G=(V,E)$ with a weight function $W : E → R$ and we wish to find a minimum spanning tree for G. The two algorithms we consider in this chapter use a greedy approach to the problem, although they differ in how they apply this approach."}
︠09fc92c8-847a-4423-ab3a-1aab75a25be8o︠
Generic-MST(G,w)
    A=0
    While A does not form a spanning tree:
        find an edge(u,v) that is safe for A
        A = A U {(u,v)}
    return A

####### Do not run :)######
︡edf8774d-0a38-4071-8fb0-60166608d3c1︡{"md":"Generic-MST(G,w)\n    A=0\n    While A does not form a spanning tree:\n        find an edge(u,v) that is safe for A\n        A = A U {(u,v)}\n    return A\n\n####### Do not run :)######"}︡{"done":true}︡
︠f0ee8ae6-a184-4de8-ba47-aa573224981ei︠
%md
**We use the loop invariant as follows:**
 - **Initialization**: After line 2, the set A trivially satisfies the loop invariant.
 - **Maintenance**: The loop in lines 3–5 maintains the invariant by adding only safe edges.
 - **Termination**: All edges added to A are in a minimum spanning tree, and so the set A returned in line 6 must be a minimum spanning tree.

 ### Finding a safe edge
Definitions :


A cut $(S,V - S)$ of an undirected graph means that their is a partition of V.

We say E crosses the cut (S, V-S) if  one of its endpoints is in S and the other is in V-S.

We say that a cut respects a set A of edges if no edge in A crosses the cut.

An edge is a light edge crossing a cut if its weight is the minimum of any edge crossing the cut.

There might be more than one safe edges and theorem 23.1 helps to recognize them :
︡db4723d9-0282-4680-9d19-791a446afcef︡{"done":true,"md":"**We use the loop invariant as follows:**\n - **Initialization**: After line 2, the set A trivially satisfies the loop invariant.\n - **Maintenance**: The loop in lines 3–5 maintains the invariant by adding only safe edges.\n - **Termination**: All edges added to A are in a minimum spanning tree, and so the set A returned in line 6 must be a minimum spanning tree.\n\n ### Finding a safe edge\nDefinitions :\n\n\nA cut $(S,V - S)$ of an undirected graph means that their is a partition of V.\n\nWe say E crosses the cut (S, V-S) if  one of its endpoints is in S and the other is in V-S.\n\nWe say that a cut respects a set A of edges if no edge in A crosses the cut.\n\nAn edge is a light edge crossing a cut if its weight is the minimum of any edge crossing the cut.\n\nThere might be more than one safe edges and theorem 23.1 helps to recognize them :"}
︠bb164bbd-6e76-430a-bf1d-f82d1f123d43si︠

## Theorem 23.1
%md
![](https://cocalc.com/cba78b3d-cc80-4275-8084-9b708da60ac6/raw/Capture.PNG)
![](https://cocalc.com/cba78b3d-cc80-4275-8084-9b708da60ac6/raw/Capture1.PNG)

Let G = (V,E) be a connected, undirected graph with a real-valued weight function w defined on E. Let A be a subset of E that is included in some minimum spanning tree for G, let(S, V-S) be any cut of G that respects A, and let (u,v) be a light edge crossing(S, V-S). Then, edge(u,v) is safe for A.


Proof : Let T be a minimum spanning tree that includes A, and assume that T does not contain the light edge $(u,v)$, since if it does, we are done. We shall construct another minimum spanning tree $T'$ that include $A U$ {$(u,v)$} by using a cut-and-paste technique, thereby showing that $(u,v)$ is a safe edge for A.
The edge $(u,v)$ i forms a cycle with the edges on the simple path p from u to v in T. In the third image, Since u and v are on opposite sides of the cut (S,V-S). at least one edge in T lies on the simple path p and also crosses the cut. Let $(x,y)$ be any such edge. The edge  $(x,y)$ is not in A, because the cut respects A. Since  $(x,y)$ is on the unique simple path from u to v in T, removing  $(x,y)$ breaks T into two components. Adding  $(u,v)$ reconnects them to form a new spanning tree $ T' = T -{(x,y)} U {(u,v)}$.
We next show that T' is a minimum spanning tree. Since  $(u,v)$ is a light edge crossing (S,V-S)  and $(x,y)$ also crosses this cut, $ w(u,v) \leq w(x,y)$. Therefore,
$ w(T') = w(T) - w(x,y) + w(u,v) \leq w(T) $

But T is a minimum spanning tree, so that $ w(T') = w(T) - w(x,y) + w(u,v) \leq w(T) $  thus T' must be a minimum spanning tree also.
It remains to show that $(u,v)$ is actually a safe edge for A. We have $ A \subseteq T'$ , since $ A \subseteq T'$ and $(x,y) \not\in T' $. Since T' is a spanning tree , $(u,v)$ is safe for A.
︡b108e71d-1c12-4e70-b9bf-4953333d3f04︡{"md":"![](https://cocalc.com/cba78b3d-cc80-4275-8084-9b708da60ac6/raw/Capture.PNG)\n![](https://cocalc.com/cba78b3d-cc80-4275-8084-9b708da60ac6/raw/Capture1.PNG)\n\nLet G = (V,E) be a connected, undirected graph with a real-valued weight function w defined on E. Let A be a subset of E that is included in some minimum spanning tree for G, let(S, V-S) be any cut of G that respects A, and let (u,v) be a light edge crossing(S, V-S). Then, edge(u,v) is safe for A.\n\n\nProof : Let T be a minimum spanning tree that includes A, and assume that T does not contain the light edge $(u,v)$, since if it does, we are done. We shall construct another minimum spanning tree $T'$ that include $A U$ {$(u,v)$} by using a cut-and-paste technique, thereby showing that $(u,v)$ is a safe edge for A.\nThe edge $(u,v)$ i forms a cycle with the edges on the simple path p from u to v in T. In the third image, Since u and v are on opposite sides of the cut (S,V-S). at least one edge in T lies on the simple path p and also crosses the cut. Let $(x,y)$ be any such edge. The edge  $(x,y)$ is not in A, because the cut respects A. Since  $(x,y)$ is on the unique simple path from u to v in T, removing  $(x,y)$ breaks T into two components. Adding  $(u,v)$ reconnects them to form a new spanning tree $ T' = T -{(x,y)} U {(u,v)}$.\nWe next show that T' is a minimum spanning tree. Since  $(u,v)$ is a light edge crossing (S,V-S)  and $(x,y)$ also crosses this cut, $ w(u,v) \\leq w(x,y)$. Therefore,\n$ w(T') = w(T) - w(x,y) + w(u,v) \\leq w(T) $\n\nBut T is a minimum spanning tree, so that $ w(T') = w(T) - w(x,y) + w(u,v) \\leq w(T) $  thus T' must be a minimum spanning tree also.\nIt remains to show that $(u,v)$ is actually a safe edge for A. We have $ A \\subseteq T'$ , since $ A \\subseteq T'$ and $(x,y) \\not\\in T' $. Since T' is a spanning tree , $(u,v)$ is safe for A."}︡{"done":true}
︠6e0c1087-aa54-44fa-a910-80bff284c133︠
%md
**Theorem 23.1** gives us a better understanding of the workings of the GENERICMST method on a connected graph G = (V,E) As the method proceeds, the
set A is always acyclic; otherwise, a minimum spanning tree including A would contain a cycle, which is a contradiction.

At any point in the execution, the graph G = (V,A) is a forest (In graph theory, a forest is an undirected, disconnected, acyclic graph), and each of the connected components of G is a tree  (Some of the trees may contain just one vertex, as is the case, for example, when the method begins: A is empty and the forest contains |V|, one for each vertex)



**Corollary 23.2**

Let G = (V, E) be a connected, undirected graph with a real-valued weight function w defined on E. Let . Let A be a subset of E that is included in some minimum
spanning tree for G,and let $C = (V_C, E_C)$ be a connected component (tree) in the forest $G_A= (V,A)$ is a light edge connecting C to some other component in $G_A$, then $(u,v)$ is safe for A.

Proof : The cut $(V_C , V - V_C)$ respects A, and $(u,v)$  is a light edge for this cut. Therefore, $(u,v)$  is safe for A
︡ebea5d56-fcfd-44b5-8017-cf4a94b26d60︡{"done":true,"md":"**Theorem 23.1** gives us a better understanding of the workings of the GENERICMST method on a connected graph G = (V,E) As the method proceeds, the\nset A is always acyclic; otherwise, a minimum spanning tree including A would contain a cycle, which is a contradiction.\n\nAt any point in the execution, the graph G = (V,A) is a forest (In graph theory, a forest is an undirected, disconnected, acyclic graph), and each of the connected components of G is a tree  (Some of the trees may contain just one vertex, as is the case, for example, when the method begins: A is empty and the forest contains |V|, one for each vertex)\n\n\n\n**Corollary 23.2**\n\nLet G = (V, E) be a connected, undirected graph with a real-valued weight function w defined on E. Let . Let A be a subset of E that is included in some minimum\nspanning tree for G,and let $C = (V_C, E_C)$ be a connected component (tree) in the forest $G_A= (V,A)$ is a light edge connecting C to some other component in $G_A$, then $(u,v)$ is safe for A.\n\nProof : The cut $(V_C ; V - V_C)$ respects A, and $(u,v)$  is a light edge for this cut. Therefore, $(u,v)$  is safe for A"}
︠34cd10b9-a989-40fc-bdbb-fc13972f67ae︠
%md

# Kruksal's Algorithm

Kruskal's algorithm is a special case of the generic minimum-spanning-tree method from the section. It finds the safe edge to add to the growing forest by finding, of all the edges that connect any two trees in the forest, an edge $(u,v)$ of least weight. It's also considered as a greedy algorithm becasue at each step, it adds to the forest an edge of least possible weight.

Let $C_1$ and $C_2$ be the two trees connected by the edge $(u,v)$, which must be a light edge connecting $C_1$ and $C_2$. Corollary 23.2 implies that $(u,v)$ is a safe edge for $C_1$.


### Disjoint data structures

A **disjoint-set data structure** maintains a collection $S=${$S_1, S_2, S_3,..., S_k$} of dis-joint dynamic sets. We identify each set by a **representative**, which is some member of the set. In some applications, it doesn’t matter which member is used as the representative; we care only that if we ask for the representative of a dynamic set twice without modifying the set between the requests, we get the same answer both times. Other applications may require a prespecified rule for choosing the representative, such as choosing the smallest member in the set (assuming, of course, that the elements can be ordered).

In Dynamic-set implementations, like Kruskal's algorithm, we represent each element of a set by an object. Letting x denote an object, we wish to support the following operations that are required in Kruskal's algorithm:

#### MAKE-SET(x):
Creates a new set whose only member (and thus representative) is x. Since the sets are disjoint, we require that x not already be in some other set.

#### UNION(x,y):
Unites the dynamic sets that contain x and y, say $S_x$ and $S_y$, into a new set that is the union of these two sets. We assume that the two sets are dis-joint prior to the operation. The representative of the resulting set is any member of **$S_x ∪ S_y$** , although many implementations of UNION specifically choose the representative of either $S_x$ or $S_y$ as the new representative. Since we require the sets in the collection to be disjoint, conceptually we destroy sets Sx and Sy, removing them from the collection $S$. In practice, we often absorb the elements of one of the sets into the other set.

#### FIND-SET(x):
Returns a pointer to the representative of the (unique) set containing x.

Our implementation of Kruskal’s algorithm uses a disjoint-set data structure to maintain several disjoint sets of elements. Each set contains the vertices in one tree of the current forest.

︡0a32659e-bf9c-46a4-91a3-08db0d878509︡{"done":true,"md":"\n# Kruksal's Algorithm\n\nKruskal's algorithm is a special case of the generic minimum-spanning-tree method from the section. It finds the safe edge to add to the growing forest by finding, of all the edges that connect any two trees in the forest, an edge $(u,v)$ of least weight. It's also considered as a greedy algorithm becasue at each step, it adds to the forest an edge of least possible weight.\n\nLet $C_1$ and $C_2$ be the two trees connected by the edge $(u,v)$, which must be a light edge connecting $C_1$ and $C_2$. Corollary 23.2 implies that $(u,v)$ is a safe edge for $C_1$.\n\n\n### Disjoint data structures\n\nA **disjoint-set data structure** maintains a collection $S=${$S_1, S_2, S_3,..., S_k$} of dis-joint dynamic sets. We identify each set by a **representative**, which is some member of the set. In some applications, it doesn’t matter which member is used as the representative; we care only that if we ask for the representative of a dynamic set twice without modifying the set between the requests, we get the same answer both times. Other applications may require a prespecified rule for choosing the representative, such as choosing the smallest member in the set (assuming, of course, that the elements can be ordered).\n\nIn Dynamic-set implementations, like Kruskal's algorithm, we represent each element of a set by an object. Letting x denote an object, we wish to support the following operations that are required in Kruskal's algorithm:\n\n#### MAKE-SET(x):\nCreates a new set whose only member (and thus representative) is x. Since the sets are disjoint, we require that x not already be in some other set.\n\n#### UNION(x,y):\nUnites the dynamic sets that contain x and y, say $S_x$ and $S_y$, into a new set that is the union of these two sets. We assume that the two sets are dis-joint prior to the operation. The representative of the resulting set is any member of **$S_x ∪ S_y$** , although many implementations of UNION specifically choose the representative of either $S_x$ or $S_y$ as the new representative. Since we require the sets in the collection to be disjoint, conceptually we destroy sets Sx and Sy, removing them from the collection $S$. In practice, we often absorb the elements of one of the sets into the other set.\n\n#### FIND-SET(x):\nReturns a pointer to the representative of the (unique) set containing x.\n\nOur implementation of Kruskal’s algorithm uses a disjoint-set data structure to maintain several disjoint sets of elements. Each set contains the vertices in one tree of the current forest."}
︠2b6505fa-c80b-447f-b035-80d1d79fdc0co︠
MST-KRUSKAL(G,w):
    A= ∅
    for each vertex v ∈ G.V
       MAKE-SET(v)
    sort the edges of G.E into nondecreasing order by weight w
    for each edge (u,v) ∈ G.E, taken in nondecreasing order by weight
       if FIND-SET(u) != FIND-SET(v):
           A=A ∪ {(u,v)}
           UNION(u,v)
    return A
︡3802ef2d-51e1-4b63-964a-017742904b9c︡{"stderr":"Error in lines 1-10\nTraceback (most recent call last):\n  File \"/cocalc/lib/python3.8/site-packages/smc_sagews/sage_server.py\", line 1231, in execute\n    compile(block + '\\n',\n  File \"<string>\", line 1\n    MST-KRUSKAL$(G,w)$:\n               ^\nSyntaxError: invalid syntax\n"}︡{"done":true}
︠69a270bb-f996-459d-896d-f63b5bd0e671︠
%md

## Pseudocode

The algorithm call is MST-KRUSKAL, which takes two input parameters: $G$, a connected graph that is assumed to have a spanning tree, thus a minimum spanning tree, and $w$ which is the weight function of the edges of the graph.


 - At line 2, we initialize an empty set $A$ that will be our output set that the function will return.
 - At lines 3-4 , we are creating $|V|$ vertices that is equal to the number of vertices in graph $G$, to which, each vertex is a tree.
 - At line 5 , we sort the edges $E$ of graph $G$ using our weight function $w$ in an increasing order.
 - The for loop in lines 6-9 examines edges in order of weight, from lowest to highest. The loop checks, for each edge $(u,v)$, whether the endpoints $u$ and $v$ belong to the same tree. If they do, then the edge $(u,v)$ cannot be added to the forest without creating a cycle, and the edge is discarded. Otherwise, the two vertices belong to different trees. In this case, line 8 adds the edge $(u,v)"$ to A, and line 9 merges the vertices in the two trees.

**We use the loop invariant as follows:**
 - **Initialization**: After line 4, the set A trivially satisfies the loop invariant being an empty set. We also have created $|V|$ trees, to which none of them is connected with each other.
 - **Maintenance**: Sorting the edges satisfies the loop inavraint as it doesn't change any edges in the graph, it only links each edge with a numerical value the describes it's weight. in each iteration of the for loop in lines 6-9, the algorithm checks for the a safe edge in $G$ that doesn't make a A connected.  Theorem 23.1 and Corollary 23.2 proves that at each iteration in the loop, only safe edges are added, thereofre, A is not connected, which satisfies the loop invariant.
 - **Termination**: Since we added all of the possibile edges, a forms some minimum spanning tree, and so the set A returned in line 10 must be a minimum spanning tree.


## Implementation, Figure 23.4
https://lucid.app/lucidchart/94896aa9-6c3e-46d2-a9ba-a9bc1ab0ce7e/edit?shared=true&page=0_0#



## Runtime analysis

The running time of Kruskal’s algorithm for a graph $G=(V,E)$ depends on how we implement the disjoint-set data structure. We assume that we use the disjoint-set-forest implementation of Section 21.3 with the union-by-rank and path-compression heuristics, since it is the asymptotically fastest implementation known.
 - Initializing the set A in line 2 takes $O(1)$ time.
 - The time to sort the edges in line 5 is $O(E Lg E)$.
 - The for loop of lines 6–9 performs $O(E)$ FIND-SET and UNION operations on the disjoint-set forest. Along with the $|V|$ MAKE-SET operations, these take a total of $O((V+E)α(V))$ time, where  $α$ is a very slowly growing function defined in Section 21.4. Because we assume that $G$ is connected, we have $|E| >= |V|$ , and so the disjoint-set operations take $O(Eα(V))$ time. Moreover, since  $α(|V|) = O(lg V) = O(lg E)$ the total running time of Kruskal’s algorithm is $O(E lg E)$. Observing that $|E| <|V|^2$ (because the maximum number of any edges in any graph $E=(V^2 -V)/2$, we have $lg|E|= O(lg V)$, and so we can restate the running time of Kruskal’s algorithm as $O(E lg V)$.







︡39531628-97b9-4229-a12f-d04dc821fc8e︡{"done":true,"md":"\n## Pseudocode\n\nThe algorithm call is MST-KRUSKAL, which takes two input parameters: $G$, a connected graph that is assumed to have a spanning tree, thus a minimum spanning tree, and $w$ which is the weight function of the edges of the graph.\n\n\n - At line 2, we initialize an empty set $A$ that will be our output set that the function will return.\n - At lines 3-4 , we are creating $|V|$ vertices that is equal to the number of vertices in graph $G$, to which, each vertex is a tree.\n - At line 5 , we sort the edges $E$ of graph $G$ using our weight function $w$ in an increasing order.\n - The for loop in lines 6-9 examines edges in order of weight, from lowest to highest. The loop checks, for each edge $(u,v)$, whether the endpoints $u$ and $v$ belong to the same tree. If they do, then the edge $(u,v)$ cannot be added to the forest without creating a cycle, and the edge is discarded. Otherwise, the two vertices belong to different trees. In this case, line 8 adds the edge $(u,v)\"$ to A, and line 9 merges the vertices in the two trees.\n\n**We use the loop invariant as follows:**\n - **Initialization**: After line 4, the set A trivially satisfies the loop invariant being an empty set. We also have created $|V|$ trees, to which none of them is connected with each other.\n - **Maintenance**: Sorting the edges satisfies the loop inavraint as it doesn't change any edges in the graph, it only links each edge with a numerical value the describes it's weight. in each iteration of the for loop in lines 6-9, the algorithm checks for the a safe edge in $G$ that doesn't make a A connected.  Theorem 23.1 and Corollary 23.2 proves that at each iteration in the loop, only safe edges are added, thereofre, A is not connected, which satisfies the loop invariant.\n - **Termination**: Since we added all of the possibile edges, a forms some minimum spanning tree, and so the set A returned in line 10 must be a minimum spanning tree.\n\n\n## Implementation, Figure 23.4\nhttps://lucid.app/lucidchart/94896aa9-6c3e-46d2-a9ba-a9bc1ab0ce7e/edit?shared=true&page=0_0#\n\n\n\n## Runtime analysis\n\nThe running time of Kruskal’s algorithm for a graph $G=(V,E)$ depends on how we implement the disjoint-set data structure. We assume that we use the disjoint-set-forest implementation of Section 21.3 with the union-by-rank and path-compression heuristics, since it is the asymptotically fastest implementation known.\n - Initializing the set A in line 2 takes $O(1)$ time.\n - The time to sort the edges in line 5 is $O(E Lg E)$.\n - The for loop of lines 6–9 performs $O(E)$ FIND-SET and UNION operations on the disjoint-set forest. Along with the $|V|$ MAKE-SET operations, these take a total of $O((V+E)α(V))$ time, where  $α$ is a very slowly growing function defined in Section 21.4. Because we assume that $G$ is connected, we have $|E| >= |V|$ , and so the disjoint-set operations take $O(Eα(V))$ time. Moreover, since  $α(|V|) = O(lg V) = O(lg E)$ the total running time of Kruskal’s algorithm is $O(E lg E)$. Observing that $|E| <|V|^2$ (because the maximum number of any edges in any graph $E=(V^2 -V)/2$, we have $lg|E|= O(lg V)$, and so we can restate the running time of Kruskal’s algorithm as $O(E lg V)$."}
︠0aefc8d2-35b1-47eb-a184-40d5822f1397︠
︡4d2f0cad-ae7d-477d-8460-02eef6ea899f︡{}︡{"done":true}
︠3d95e79f-e0d4-48c5-8ae6-7fd4db1f3517i︠

%md
## Prim's algorithm
Like Kruskal’s algorithm, Prim’s algorithm is a special case of the generic minimum-spanning-tree method from Section 23.1.

Prim’s algorithm has the property that the edges in the set A always form a single tree. In Prim's algorithm, the tree starts from an arbitrary root
vertex r and grows until the tree spans all the vertices in V. Each step adds to the tree A a light edge that connects A to an isolated vertex—one on which no edge
of A is incident. By Corollary 23.2, this rule adds only edges that are safe for A;

Therefore, when the algorithm terminates, the edges in A form a minimum spanning tree.

This strategy qualifies as greedy since at each step it adds to the tree an edge that contributes the minimum amount possible to the tree’s weight.

In order to implement Prim’s algorithm efficiently, we need a fast way to select a new edge to add to the tree formed by the edges in A.

In the pseudocode below,the connected graph G and the root r of the minimum spanning tree to be grown are inputs to the algorithm.

For each vertex , the attribute v.key is the minimum weight of any edge connecting to a vertex in the tree; by convention, v.key = ∞ if there is no such edge. On the other hand, v.$\pi$ names the parent v of the tree.  The algorithm implicitly maintains the set A from GENERIC-MST as $A = {(v,v.\pi):v∈ V-{r}-Q}$ where r is the  the root r of the minimum spanning tree.

When the algorithm terminates, the min-priority queue Q is empty : $A = {(v,v.\pi):v∈ V-{r}}$


︡0b67c43d-433d-4586-86c0-594fc43156b0︡{"done":true,"md":"## Prim's algorithm\nLike Kruskal’s algorithm, Prim’s algorithm is a special case of the generic minimum-spanning-tree method from Section 23.1.\n\nPrim’s algorithm has the property that the edges in the set A always form a single tree. In Prim's algorithm, the tree starts from an arbitrary root\nvertex r and grows until the tree spans all the vertices in V. Each step adds to the tree A a light edge that connects A to an isolated vertex—one on which no edge\nof A is incident. By Corollary 23.2, this rule adds only edges that are safe for A;\n\nTherefore, when the algorithm terminates, the edges in A form a minimum spanning tree.\n\nThis strategy qualifies as greedy since at each step it adds to the tree an edge that contributes the minimum amount possible to the tree’s weight.\n\nIn order to implement Prim’s algorithm efficiently, we need a fast way to select a new edge to add to the tree formed by the edges in A.\n\nIn the pseudocode below,the connected graph G and the root r of the minimum spanning tree to be grown are inputs to the algorithm.\n\nFor each vertex , the attribute v.key is the minimum weight of any edge connecting to a vertex in the tree; by convention, v.key = ∞ if there is no such edge. On the other hand, v.\\pi names the parent v of the tree.  The algorithm implicitly maintains the set A from GENERIC-MST as $A = {(v,v.\\pi):v∈ V-{r}-Q}$ where r is the  the root r of the minimum spanning tree.\n\nWhen the algorithm terminates, the min-priority queue Q is empty : $A = {{(v,v.\\pi):v∈ V-{r}}}$"}
︠15ccc02f-490b-4d79-b981-646ec4b8d922︠
####### Do not run :)######
#pseudocode

1. MST-Prim(G,w, r)
2. for each u ∈ G.V
    3. u.key = ∞
    4. u.π = NIL
5. r.key = 0
6. Q = G.V
7. while Q ≠ ∅
    8. u = EXTRACT-MIN (Q)
    9. for each v ∈ G.adj[u]
        10. if v ∈ Q and w(u,v) < v.key
           11.  v.π = u
            12. v.key = w(u,v)
####### Do not run :)######
︡74c33965-0872-491f-987c-cde27a69c59a︡
︠328f39c6-16f6-4c82-aabf-fe0b7bf76f69︠

%md
Lucid chart : https://lucid.app/lucidchart/invitations/accept/inv_e9874790-df01-4a69-96ed-8c0f124ae034

The Lucid chart shows how Prim Algorithm works. Lines 1-5 set the key of each vertex to 1 (except for the root r, whose key is set to 0 so that it will be the first vertex processed),set the parent of each vertex to NIL, and initialize the minpriority queue Q to contain all the vertices.set the parent of each vertex to NIL, and initialize the minpriority queue Q to contain all the vertices. The algorithm maintains the following three-part loop invariant:

Prior to each iteration of the while loop of lines 6–11,

1.  $A = {(v,v.\pi):v∈ V-{r}}$

2. The vertices already placed into the minimum spanning tree are those in $V-Q$.

3. For all vertices  v $\in$ Q, if v. $\pi$ NIL, then v.key < $\pi$  and v.key is the weight of a light edge connecting  to some vertex v already placed into the minimum spanning tree.

Line 7 identifies a vertex u $\in$ Q incident on a light edge that crosses the cut (V - Q, Q), Removing u from the set Q adds it to the set V - Q of vertices in the tree, thus adding (u, u.$\pi$) to A.

The for loop of lines 8–11 updates the key and $\pi$ attributes of every vertex  adjacent to u but not in the tree, thereby maintaining the third part of the loop invariant.
︡f2532a4e-7854-436f-a498-337cf93c4207︡{"done":true,"md":"Lucid chart : https://lucid.app/lucidchart/invitations/accept/inv_e9874790-df01-4a69-96ed-8c0f124ae034\n\nThe Lucid chart shows how Prim Algorithm works. Lines 1-5 set the key of each vertex to 1 (except for the root r, whose key is set to 0 so that it will be the first vertex processed),set the parent of each vertex to NIL, and initialize the minpriority queue Q to contain all the vertices.set the parent of each vertex to NIL, and initialize the minpriority queue Q to contain all the vertices. The algorithm maintains the following three-part loop invariant:\n\nPrior to each iteration of the while loop of lines 6–11,\n\n1.  $A = {(v,v.\\pi):v∈ V-{r}}$\n\n2. The vertices already placed into the minimum spanning tree are those in $V-Q$.\n\n3. For all vertices  v $\\in$ Q, if v. $\\pi$ NIL, then v.key < $\\pi$  and v.key is the weight of a light edge connecting  to some vertex v already placed into the minimum spanning tree.\n\nLine 7 identifies a vertex u $\\in$ Q incident on a light edge that crosses the cut (V - Q, Q), Removing u from the set Q adds it to the set V - Q of vertices in the tree, thus adding (u, u.$\\pi$) to A.\n\nThe for loop of lines 8–11 updates the key and $\\pi$ attributes of every vertex  adjacent to u but not in the tree, thereby maintaining the third part of the loop invariant."}
︠f1e79134-2886-4b8a-a135-cb79cb6f25ee︠
%md
The running time of Prim’s algorithm depends on how we implement the minpriority queue Q.  If we implement Q as a binary min-heap, we
can use the BUILD-MIN-HEAP procedure to perform lines 1–5 in $O(V)$ time. The
body of the while loop executes V times, and since each EXTRACT-MIN operation takes $O(lgV)$ time, the total time for all calls to EXTRACT-MIN is $O(VlgV)$

The for loop in lines 8–11 executes O(E) times altogether, since the sum of thelengths of all adjacency lists is 2 |E| . Within the for loop, we can implement the
test for membership in Q in line 9 in constant time by keeping a bit for each vertex that tells whether or not it is in Q, and updating the bit when the vertex is removed from Q. The assignment in line 11 operation on the min-heap, which a binary min-heap supports in O(lg V) time.

So, the running time is $O(ElgV)$

We can improve the asymptotic running time of Prim’s algorithm by using Fibonacci heaps. if we use a
Fibonacci heap to implement the min-priority queue Q, the running time of Prim’s algorithm improves to O(E+VlgV).


︡2b0bed4b-a179-416d-bda7-9d27e1c3373a︡{"done":true,"md":"The running time of Prim’s algorithm depends on how we implement the minpriority queue Q.  If we implement Q as a binary min-heap, we\ncan use the BUILD-MIN-HEAP procedure to perform lines 1–5 in $O(V)$ time. The\nbody of the while loop executes V times, and since each EXTRACT-MIN operation takes $O(lgV)$ time, the total time for all calls to EXTRACT-MIN is $O(VlgV)$\n\nThe for loop in lines 8–11 executes O(E) times altogether, since the sum of thelengths of all adjacency lists is 2 |E| . Within the for loop, we can implement the\ntest for membership in Q in line 9 in constant time by keeping a bit for each vertex that tells whether or not it is in Q, and updating the bit when the vertex is removed from Q. The assignment in line 11 operation on the min-heap, which a binary min-heap supports in O(lg V) time.\n\nSo, the running time is $O(ElgV)$\n\nWe can improve the asymptotic running time of Prim’s algorithm by using Fibonacci heaps. if we use a\nFibonacci heap to implement the min-priority queue Q, the running time of Prim’s algorithm improves to O(E+VlgV)."}










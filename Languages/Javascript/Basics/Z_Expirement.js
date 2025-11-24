const N = 20
const BS = 3;

class posting {
    constructor({term, doc_ids, scores}) {
        Object.assign(this, {term, doc_ids, scores});
        this.idf = N / Math.log(doc_ids.length)
        this.pointer = 0;
        this.block_pointer = 0;
        this.max_score = Math.max(...scores);

        const num_blocks = Math.ceil(doc_ids.length / BS);
        this.block_firsts = Array.from({length: num_blocks}, (_, i) => doc_ids[BS * i]);
        this.block_maxes = Array.from({length: num_blocks}, (_, i) => Math.max(...scores.slice(BS*i, BS*(i + 1))));
    }
}


postings = [
    new posting({term: "a", doc_ids: [1,4,6,9,13,15,17], scores: [.1,.4,.6,.9,.13,.15,.17]}),
    new posting({term: "b", doc_ids: [1,5,8,9,10,19], scores: [.1,.5,.8,.9,.1,.19]}),
    new posting({term: "c", doc_ids: [2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19], scores: [.2,.4,.5,.6,.7,.8,.9,.10,.11,.12,.13,.14,.15,.16,.17,.18,.19]}),
    new posting({term: "d", doc_ids: [3,5,10,20], scores: [.3,.5,.1,.2]}),
    new posting({term: "f", doc_ids: [1,9,14,17,19,20], scores: [.1,.9,.14,.17,.19,.2]}),
    new posting({term: "g", doc_ids: [6,7,8,11,12,14,15,16,17,19], scores: [.6,.7,.8,.11,.12,.14,.15,.16,.17,.19]}),
    new posting({term: "h", doc_ids: [9], scores: [.9]}),
    new posting({term: "i", doc_ids: [3], scores: [.3]})
]

//console.table(postings)

const get_did = (i) => postings[i].doc_ids[postings[i].pointer];
const get_did_score = (i) => postings[i].scores[postings[i].pointer];
const get_blk_first = (i, next = false) => postings[i].block_firsts[postings[i].block_pointer + next];
const get_blk_max = (i) => postings[i].block_maxes[postings[i].block_pointer];


function nextGEQ(i, d){
    while (get_did(i) < d){
        postings[i].pointer += 1;
        if (postings[i].pointer >= postings[i].doc_ids.length){
            postings[i].pointer = null;
            break;
        }
    }
}


// Top k min heap implementation
class TopK {
    constructor(k) {
        this.k = k;
        this.heap = [];
    }

    top() { return (this.heap.length == 0) ? -Infinity : this.heap[0].score; }
    sc(i) { return (i < this.heap.length) ? this.heap[i].score : -Infinity; }
    swap(i1,i2) { [this.heap[i1], this.heap[i2]] = [this.heap[i2], this.heap[i1]]; }

    evaluate(doc_id, score) {
        const new_node = {doc_id: doc_id, score: score};
        if (this.heap.length < this.k) this.insert(new_node);       // if heap len < k, insert new node and re-sort heap
        else if (score > this.top()) this.replace_root(new_node);        // if heap len > k, replace root node with new node and re-sort heap
        else return false;      // if new node wasn't added return false
        return true;            // otherwise return true
    }

    insert(new_node) {
        this.heap.push(new_node);           // add new node as a leaf
        let i = this.heap.length - 1;       // index to track new node in heap as it moves

        // Move node up until it is in the right position
        while(i){
            const p_idx = (i-1) >> 1;       // parent index of node (i>>1 is less verbose than Math.floor(i/2) BUT converts to INT32)
            if(this.heap[i].score >= this.heap[p_idx].score) break;         // if node >= parent node then it is in the right place
            this.swap(i, p_idx);
            i = p_idx;
        }
    }

    replace_root(new_node){
        this.heap[0] = new_node;    // replace the root node with the new node
        let i = 0;              // index to track new node in heap as it moves

        // Move node down until it is in the right position
        while(true) {
            const l = (i << 1) + 1;         // current left child of new node
            const r = l + 1;                // current right child of new node
            const n = this.heap.length;
            let swap_idx = i;               // index of the node we will swap with new node
            if(l < n && this.heap[l].score < this.heap[swap_idx].score) swap_idx = l;       // if l in heap and < new node, swap_idx = l
            if(r < n && this.heap[r].score < this.heap[swap_idx].score) swap_idx = r;       // if r in heap and < new node and l, swap_idx = r
            if(swap_idx === i) break;       // if swap index is unchanged the new node is in the correct position
            this.swap(i, swap_idx);         // otherwise swap chosen node and new node
            i = swap_idx;                   // update index of new node
        }
    }

    toArray(){ return this.heap.sort((a,b)=>b.score-a.score); }
}



console.log(Math.min(3, undefined));
console.log("");
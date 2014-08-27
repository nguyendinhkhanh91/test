<?php
class PostsController extends AppController {
	var $uses = array('Post', 'User');
    public $helpers = array('Html', 'Form');
    public function index() {
//        $this->set('posts', $this->Post->find('all'));
//        error_log(var_export($this->Post->find('all'), true), 3, '../tmp/logs/debug.log');
//        CakeLog::error(var_export($this->Post->find('all'), true));
    	$this->paginate = array(
    		'limit' => 10,
    		'fields' => array('Post.id', 'Post.title', 'Post.created'),
    		'conditions' => '', 
    		);
    		$posts = $this->paginate('Post');
    		$this->set(compact('posts'));
    }
	public function isAuthorized($user) {
	    // All registered users can add posts
	    if ($this->action === 'add') {
	        return true;
	    }
	
	    // The owner of a post can edit and delete it
	    if (in_array($this->action, array('edit', 'delete'))) {
	        $postId = (int) $this->request->params['pass'][0];
	        if ($this->Post->isOwnedBy($postId, $user['id'])) {
	            return true;
	        }
	    }
	
	    return parent::isAuthorized($user);
	}
    public function view($id = null) {
        if (!$id) {
            throw new NotFoundException(__('Invalid post'));
        }

        $post = $this->Post->findById($id);
        if (!$post) {
            throw new NotFoundException(__('Invalid post'));
        }
        $this->set('post', $post);
    }
    public function add() {
        if ($this->request->is('post')) {
            $this->request->data['Post']['user_id'] = $this->Auth->user('id');
            if ($this->Post->save($this->request->data)) {
                $this->Session->setFlash(__('Your post has been saved.'));
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash(__('Unable to add your post.'));
        }
    }
	public function edit($id = null) {
	    if (!$id) {
	        throw new NotFoundException(__('Invalid post'));
	    }
	
	    $post = $this->Post->findById($id);
	    if (!$post) {
	        throw new NotFoundException(__('Invalid post'));
	    }
	
	    if ($this->request->is(array('post', 'put'))) {
	        $this->Post->id = $id;
	        if ($this->Post->save($this->request->data)) {
	            $this->Session->setFlash(__('Your post has been updated.'));
	            return $this->redirect(array('action' => 'index'));
	        }
	        $this->Session->setFlash(__('Unable to update your post.'));
	    }
	
	    if (!$this->request->data) {
	        $this->request->data = $post;
	    }
	}
	public function delete($id) {
	    if ($this->request->is('get')) {
	        throw new MethodNotAllowedException();
	    }
	
	    if ($this->Post->delete($id)) {
	        $this->Session->setFlash(
	            __('The post with id: %s has been deleted.', h($id))
	        );
	        return $this->redirect(array('action' => 'index'));
	    }
	}
    public function copy() {
        if (isset($_POST['id'])) {
            $record = $this->Post->find('first', array(
                'conditions' => array('id' => $_POST['id']))
            );
            $data = array(
            	'title' => $record['Post']['title'],
            	'body' => $record['Post']['body']);
            $this->Post->create();
            $this->Post->save($data);
            $post = $this->Post->find('first', array(
                'order' => array('id' => 'DESC')));
            $data['id'] = $post['Post']['id'];
            $data['title'] = $post['Post']['title'];
            $data['created'] = $post['Post']['created'];
            echo json_encode($data);
            die();
        }
    }
}
?>
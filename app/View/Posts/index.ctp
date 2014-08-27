<!-- File: /app/View/Posts/index.ctp -->
<?php echo $this->Html->script ('jquery-1.11.0.min.js');
?>
<h1>Blog posts</h1>
<p><?php echo $this->Html->link('Add Post', array('action' => 'add')); ?></p>
<table>
    <tr>
        <th><?php echo $this->Paginator->sort('id','Id');?></th>
        <th><?php echo $this->Paginator->sort('title','Title');?></th>
        <th>Actions</th>
        <th><?php echo $this->Paginator->sort('created','Created');?></th>
        <th></th>
    </tr>

<!-- Here's where we loop through our $posts array, printing out post info -->
    <?php foreach ($posts as $post){ ?>
    <tr>
        <td><?php echo $post['Post']['id']; ?></td>
        <td>
            <?php
                echo $this->Html->link(
                    $post['Post']['title'],
                    array('action' => 'view', $post['Post']['id'])
                );
            ?>
        </td>
        <td>
            <?php
                echo $this->Form->postLink(
                    ' Delete',
                    array('action' => 'delete', $post['Post']['id']),
                    array('confirm' => 'Are you sure?')
                );
            ?>
            <?php
                echo $this->Html->link(
                    'Edit', array('action' => 'edit', $post['Post']['id'])
                );
            ?>
        </td>
        <td>
            <?php echo $post['Post']['created']; ?>
        </td>
        <td>
        <?php
            echo $this->Form->button(
                'Copy',
                array('class' => 'copybutton', 'id' => $post['Post']['id'], 'type' => 'button',)
            );
        ?>
        </td>
    </tr>
    <?php }?>
</table>
<div class="paging">
    <?php
    echo $this->Paginator->counter(array('format' => __(' {:start}  〜 {:end} 　（{:page}/{:pages}）')));
	echo "<br>";
    echo $this->Paginator->first('<<');
    echo $this->Paginator->prev(__('<'), array(), null, array('class' => 'prev disabled'));
    echo $this->Paginator->numbers(array('modulus' => 4, 'separator' => false));
    echo $this->Paginator->next(__('>'), array(), null, array('class' => 'next disabled'));
    echo $this->Paginator->last('>>');
    ?>
</div>
<script>
    $(document).ready(function(){
        $('.copybutton').click(function(e){
            e.preventDefault();
            var id = $(this).attr('id');
                $.ajax({
                    type: 'POST',
                    url: '<?php echo $this->webroot . "Posts/copy" ?>',
                    data: { id: id},
                    success:function(data) {
                    var data =  $.parseJSON(data);
                    $('table').append('<tr><td>'+data['id']+'</td><td><a href="test/Posts/view/'+data['id']+'">'+data['title']+'</a></td><td></td><td>'+data['created']+'</td><td></td></tr>');
                }
                });
        });
    });
</script>
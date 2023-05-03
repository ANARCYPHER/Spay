<?php

        $ReportsListing = $this->db->from(null,'
            SELECT 
            reports.id,
            reports.report_id,
            reports.body,
            reports.user as username,
            reports.created,
            reports.url,
            reports.status,
            reports.reply,
            posts.title,
            posts.type
            FROM `reports`
            LEFT JOIN posts ON reports.content_id = posts.id AND reports.content_id
            WHERE reports.user = "'.$Listing['username'].'"
            ORDER BY reports.id DESC  
            LIMIT 5')
            ->all();

?>
<style>
@media only screen and (max-width: 763px) {
  .report-title {
    display: none;
  }
}
</style>
<div class="profile-box">
    <div class="profile-heading">
        <?php echo __('Support');?>
    </div><div class="table-responsive">
<table class="table table-theme table-row v-middle" style="border-collapse: separate!important;border-spacing: 0 8px!important;">
<thead class="text-muted">
<tr>
<th width="100" style="font-size: 12px; font-weight: 500; border: 0;padding: 0.25rem 1rem"></th>
<th style="font-size: 12px; font-weight: 500; border: 0; padding: .25rem 2rem;">Support Topic</th>
<th class="text-right" style="font-size: 12px; font-weight: 500; border: 0; padding: .25rem 2rem;"></th>
</tr>
</thead>
    <tbody style="border-spacing: 0 8px!important;">
    <?php foreach ($ReportsListing as $Report) { ?>
<tr style="height:40px;background-color:#101010;">
<th width="100" style="border: none;font-weight: 500;color: #969696!important;font-size:14px;padding: 1.1rem 2rem;border-radius:6px 0px 0px 6px;">#<?php echo $Report['id']; ?></th>
<th style="border: none;font-weight: 500;color: #969696!important;font-size:14px;padding: 1.1rem 2rem;vertical-align: middle;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;max-width: 50px;"><?php echo $Report['title']; ?></th>
<th id="report_<?php echo $Report['id']; ?>" style="border: none;font-weight: 500;color: #969696!important;font-size:12px;padding: 1.1rem 2rem;vertical-align: middle;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">View Reply</th>
<th style="border: none;float:right;border-radius:0px 6px 6px 0px;padding: 1.1rem;">            	
             	<?php if ($Report['status'] == 2) { echo '<span style="padding: 5px 10px;border-radius: 3px;font-size: 10px;" class="badge bg-warning-lt ml-2">Reported Pending</span>'; } else { echo '<div style="padding: 5px 10px;border-radius: 3px;font-size: 10px;" class="badge bg-primary-lt ml-2">Report Resolved</div>'; }?>
        	</th>
</tr>
<th id="report_<?php echo $Report['id']; ?>_div" colspan="4" style="display: none;padding:2rem;background-color:#101010;height:auto;border: none;color: #969696!important;font-size:14px;border-radius:6px 6px 6px 6px;">
<font style="font-weight: bold;";>Support Reply:</font>                
<br>
                <br><font style="font-weight: 200;";><?php if ($Report['reply'] == '' ) { echo 'No comment has been made yet.'; } else { echo $Report['reply']; } ?></font></th>
<script>
$(document).ready(function(){
  $("#report_<?php echo $Report['id']; ?>").click(function(){
    $("#report_<?php echo $Report['id']; ?>_div").slideToggle();
  });
});
</script>
    <?php } ?>
</tbody>
</table>
</div></div>
    

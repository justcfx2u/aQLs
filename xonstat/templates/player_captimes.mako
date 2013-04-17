<%inherit file="base.mako"/>
<%namespace name="nav" file="nav.mako" />

<%block name="title">
Player captimes
</%block>

% if len(captimes) == 0:
  <h2>Sorry, no caps yet. Get playing!</h2>
% else:

<div class="row">
  <div class="span12">
    <h3>Fastest Flag Captures by ${player.nick_html_colors()|n}</h3>
    <p><a href="${player_url}">Back to player info page</a></p>
 
    <table class="table table-hover table-condensed">
      <thead>
        <tr>
           <th>Game</th>
           <th>Captime</th>
           <th>Map</th>
           <th>Server</th>
           <th>Date</th>
        </tr>
      </thead>
      <tbody>
      % for ct in captimes:
        <tr>
          <td class="tdcenter"><a class="btn btn-primary btn-small" href="${request.route_url('game_info', id=ct.game_id)}" title="View detailed information about this game">view</a></td>
          <td>${ct.fastest_cap.total_seconds()} seconds</td>
          <td><a href="${request.route_url('map_info', id=ct.map_id)}" title="Go to the detail page for this map">${ct.map_name}</a></td>
          <td><a href="${request.route_url('server_info', id=ct.server_id)}" title="Go to the detail page for this server">${ct.server_name}</a></td>
          <td><span class="abstime" data-epoch="${ct.create_dt_epoch}" title="${ct.create_dt.strftime('%a, %d %b %Y %H:%M:%S UTC')}">${ct.create_dt_fuzzy}</span></td>
      % endfor
      </tbody>
    </table>

  </div>
</div>

% endif

#!/bin/bash
 
ATS_IP=$1
ZBX_ITEM_KEY=$2
TMP_FILE=/tmp/ats_stats_tmp_$ATS_IP
ATS_STATS="http://$ATS_IP/_stats"
 
case "$2" in
    getstat)
        HTTPCODE=$(curl -s -w %{http_code} $ATS_STATS -o $TMP_FILE)
         
        if [ "$HTTPCODE" == 200 ];then
            echo 1
        else
            echo 0
        fi
    ;;
    hostname)
        cat $TMP_FILE | grep -iw proxy.node.hostname | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Objects_served)
        cat $TMP_FILE | grep -iw proxy.node.user_agents_total_documents_served | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Transactions_per_second)
        cat $TMP_FILE | grep -iw proxy.node.user_agent_xacts_per_second | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Document_hit_rate)
        cat $TMP_FILE | grep -iw proxy.node.cache_hit_ratio_avg_10s | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Bandwidth_savings)
        cat $TMP_FILE | grep -iw proxy.node.bandwidth_hit_ratio_avg_10s | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Cache_percent_free)
        cat $TMP_FILE | grep -iw proxy.node.cache.percent_free | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Open_origin_server_connections)
        cat $TMP_FILE | grep -iw proxy.node.current_server_connections | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Open_client_connections)
        cat $TMP_FILE | grep -iw proxy.node.current_client_connections | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Cache_transfers_in_progress)
        cat $TMP_FILE | grep -iw proxy.node.current_cache_connections | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Client_throughput_Mbits/sec)
        cat $TMP_FILE | grep -iw proxy.node.client_throughput_out | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Transactions_per_second)
        cat $TMP_FILE | grep -iw proxy.node.user_agent_xacts_per_second | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    DNS_lookups_per_second)
        cat $TMP_FILE | grep -iw proxy.node.dns.lookups_per_second | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Host_database_hit_rate)
        cat $TMP_FILE | grep -iw proxy.node.hostdb.hit_ratio_avg_10s | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_document_bytes_from_client)
        cat $TMP_FILE | grep -iw proxy.process.http.user_agent_response_document_total_size | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_header_bytes_from_client)
        cat $TMP_FILE | grep -iw proxy.process.http.user_agent_response_header_total_size | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_connections_to_client)
        cat $TMP_FILE | grep -iw proxy.process.http.total_client_connections | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Client_transactions_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.http.current_client_transactions | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_document_bytes_from_origin_server)
        cat $TMP_FILE | grep -iw proxy.process.http.origin_server_response_document_total_size | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_header_bytes_from_origin_server)
        cat $TMP_FILE | grep -iw proxy.process.http.origin_server_response_header_total_size | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_connections_to_origin_server)
        cat $TMP_FILE | grep -iw proxy.process.http.total_server_connections | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Origin_server_transactions_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.http.current_server_transactions | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Bytes_used)
        cat $TMP_FILE | grep -iw proxy.process.cache.bytes_used | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Cache_size)
        cat $TMP_FILE | grep -iw proxy.process.cache.bytes_total | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Lookups_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.cache.lookup.active | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Lookups_completed)
        cat $TMP_FILE | grep -iw proxy.process.cache.lookup.success | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Lookup_misses)
        cat $TMP_FILE | grep -iw proxy.process.cache.lookup.failure | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Reads_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.cache.read.active | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Reads_completed)
        cat $TMP_FILE | grep -iw proxy.process.cache.read.success | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Read_misses)
        cat $TMP_FILE | grep -iw proxy.process.cache.read.failure | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Writes_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.cache.write.active | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Writes_completed)
        cat $TMP_FILE | grep -iw proxy.process.cache.write.success | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Write_failures)
        cat $TMP_FILE | grep -iw proxy.process.cache.write.failure | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Updates_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.cache.update.active | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Updates_completed)
        cat $TMP_FILE | grep -iw proxy.process.cache.update.success | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Update_failures)
        cat $TMP_FILE | grep -iw proxy.process.cache.update.failure | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Removes_in_progress)
        cat $TMP_FILE | grep -iw proxy.process.cache.remove.active | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Remove_successes)
        cat $TMP_FILE | grep -iw proxy.process.cache.remove.success | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Remove_failures)
        cat $TMP_FILE | grep -iw proxy.process.cache.remove.failure | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_lookups)
        cat $TMP_FILE | grep -iw proxy.process.hostdb.total_lookups | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Total_hits)
        cat $TMP_FILE | grep -iw proxy.process.hostdb.total_hits | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Time_TTL_min)
        cat $TMP_FILE | grep -iw proxy.process.hostdb.ttl | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    DNS_total_lookups)
        cat $TMP_FILE | grep -iw proxy.process.dns.total_dns_lookups | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Average_lookup_time_msec)
        cat $TMP_FILE | grep -iw proxy.process.dns.lookup_avg_time | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    DNS_successes)
        cat $TMP_FILE | grep -iw proxy.process.dns.lookup_successes | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Log_files_currently_open)
        cat $TMP_FILE | grep -iw proxy.process.log.log_files_open | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Space_used_for_log_files)
        cat $TMP_FILE | grep -iw proxy.process.log.log_files_space_used | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Number_of_access_events_skipped)
        cat $TMP_FILE | grep -iw proxy.process.log.event_log_access_skip | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Number_of_congestions_Traffic_Server_has_observed_because_the_maximum_number_of_connections_was_exceeded.)
        cat $TMP_FILE | grep -iw proxy.process.congestion.congested_on_max_connection | awk '{print $2}' | cut -d "\"" -f 2
    ;;
    Number_of_congestions_Traffic_Server_has_observed_because_of_an_OS_response_or_timeout_failure.)
        cat $TMP_FILE | grep -iw proxy.process.congestion.congested_on_conn_failures | awk '{print $2}' | cut -d "\"" -f 2
    ;;
esac

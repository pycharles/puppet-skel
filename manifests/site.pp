import "./roles.pp"
import "configuration/*.pp"

notify {"Here we go...":}

node default {
  include role_common
}

node puppet01 {
  include role_puppetslave
}
